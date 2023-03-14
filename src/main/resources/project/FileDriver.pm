####################################################################
#
# ECSCM::File::Driver  Object to represent interactions with
#        perforce.
####################################################################
package ECSCM::File::Driver;
@ISA = (ECSCM::Base::Driver);
use ElectricCommander;
use Time::Local;
use HTTP::Date(qw {str2time time2str time2iso time2isoz});
use Digest::MD5;
use File::stat;

if (!defined ECSCM::Base::Driver) {
    require ECSCM::Base::Driver;
}

if (!defined ECSCM::File::Cfg) {
    require ECSCM::File::Cfg;
}


####################################################################
# Object constructor for ECSCM::File::Driver
#
# Inputs
#    cmdr          previously initialized ElectricCommander handle
#    name          name of this configuration
#
####################################################################
sub new {
    my $this = shift;
    my $class = ref($this) || $this;

    my $cmdr = shift;
    my $name = shift;

    my $cfg = new ECSCM::File::Cfg($cmdr, "$name");
    my $sys = $cfg->getSCMPluginName();
    if ("$sys" ne "ECSCM-File") { die "SCM config $name is not type ECSCM-File"; }

    my ($self) = new ECSCM::Base::Driver($cmdr,$cfg);

    bless ($self, $class);
    return $self;
}

####################################################################
# isImplemented
####################################################################
sub isImplemented {
    my ($self, $method) = @_;

    if ($method eq 'getSCMTag') {
        return 1;
    } else {
        return 0;
    }
}

####################################################################
# getSCMTag
#
# Get the latest changelist on this branch/client
#
# Args:
# Return:
#    changeNumber - a string representing the last change sequence #
#    changeTime   - a time stamp representing the time of last change
####################################################################
sub getSCMTag {
    my ($self, $opts) = @_;

    my $triggerFileName = $opts->{TriggerFileName};
    $self->debug("Checking $triggerFileName");
    my $hash_code = $self->generateHash($triggerFileName);
    #get the previous hash code
    $last = $opts->{LASTATTEMPTED};

    my $changeTimeStamp = 0;

    #check if the current hash is different from the last/stored hash
    if(($last && $last ne $hash_code) || $last eq ""){
        print join("\n",    "-----------------------",
                            "New changes were found!!",
                            "Previous md5 hash: $last",
                            "New md5 hash:      $hash_code",
                            "-----------------------",
                            )."\n";
        #Create a new timestamp.
        my @filenames = split(/\|/, $triggerFileName);
        for my $filename ( @filenames ) {
            my $stat = stat($filename);
            if ($stat && $stat->mtime > $changeTimeStamp) {
                $changeTimeStamp = $stat->mtime;
            }
        }
    }
    return ($hash_code, $changeTimeStamp);
}

=head2 generateHash

  Title    : generateHash
  Usage    : $self->generateHash("c:\\file1|c:\\file2");
  Function : Creates a unique identifier for a set of files
  Returns  : Returns an md5 hash of all md5 hashes of each file specified in the $files parameter
  Args     : named arguments:
           : -files => list of files separated by a "|" simbol.
           :
=cut
sub generateHash{
    my ($self, $files) = @_;
    my @found_files = split(/\|/, $files);
    $md5 = Digest::MD5->new;
    foreach my $file (@found_files){
        if(-e $file){
            open(FILE, $file) or die "Can't open '$file': $!";
            binmode(FILE);
            $md5->add(Digest::MD5->new->addfile(*FILE)->hexdigest);
            close FILE;
        }else{
            $self->issueWarningMsg ("*** ElectricSentry could not retrieve status for the file:\n" .
                                "        $file\n" .
                                "    OS message: $!");
            exit 0;
        }
    }
    return $md5->hexdigest;
}

1;
