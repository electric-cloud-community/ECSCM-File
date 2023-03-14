# ECSCM-File

Use this plugin with ElectricSentry to watch for changes in files.

# Plugin configuration

Plugin configurations are sets of parameters that apply across some or
all of the plugin’s procedures. They are intended to reduce repetition
of common values, create predefined sets of parameters for end users,
and to securely store credentials where needed. Each configuration is
given a unique name that is entered in designated parameters on
procedures that use them.

## Configuration parameters

<table>
<colgroup>
<col style="width: 50%" />
<col style="width: 50%" />
</colgroup>
<thead>
<tr class="header">
<th style="text-align: left;">Parameter</th>
<th style="text-align: left;">Description</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td style="text-align: left;"><p>SCM Type</p></td>
<td style="text-align: left;"><p>Select the SCM Type, in this case
"File".(Required)</p></td>
</tr>
<tr class="even">
<td style="text-align: left;"><p>Configuration Name</p></td>
<td style="text-align: left;"><p>Provide a unique name for the
configuration, keeping in mind that you may need to create additional
configurations over time. (Required)</p></td>
</tr>
<tr class="odd">
<td style="text-align: left;"><p>Description</p></td>
<td style="text-align: left;"><p>You can supply a text description only
for your reference. CD does not use this information.</p></td>
</tr>
</tbody>
</table>

![screenshot](htdocs/images/ecscm-file-1.png)

# Plugin procedures

## Sentry schedule

This procedure is used for continuous integration. It constantly looks
for changes in a file or a set of files.

<table>
<colgroup>
<col style="width: 50%" />
<col style="width: 50%" />
</colgroup>
<thead>
<tr class="header">
<th style="text-align: left;">Parameter</th>
<th style="text-align: left;">Description</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td style="text-align: left;"><p>Trigger file name(s):</p></td>
<td style="text-align: left;"><p>The full path of a file or set of files
separated by a "</p></td>
</tr>
<tr class="even">
<td style="text-align: left;"><p>" character to be monitored.
(Required)</p></td>
<td style="text-align: left;"><p>Quiet time minutes</p></td>
</tr>
<tr class="odd">
<td style="text-align: left;"><p>The number of minutes of no check-in
activity required before launching the procedure.</p></td>
<td style="text-align: left;"><p>Enabled for ElectricSentry</p></td>
</tr>
</tbody>
</table>

![screenshot](htdocs/images/ecscm-file-2.png)

# Release notes

## ECSCM-File 2.0.8

-   Migrated to community

## ECSCM-File 2.0.7

-   The documentation has been migrated to the main documentation site.

## ECSCM-File 2.0.6

-   Renaming to "CloudBees CD/RO"

## ECSCM-File 2.0.5

-   Renaming to "CloudBees"

## ECSCM-File 2.0.4

-   Added help link to the Sentry form.

## ECSCM-File 2.0.3

-   Monitor several files is now possible.

## ECSCM-File 2.0.2

-   Visibility for *GetSCMTag* and *Create configuration* subprocedures
    were set to private.

## ECSCM-File 2.0.1

-   Updated help page format

## ECSCM-File 2.0.0

-   Updated help page format

## ECSCM-File 1.0.2

-   Updated help page

## ECSCM-File 1.0.0

-   SCM features - Sentry

-   SCM features - Configuration
