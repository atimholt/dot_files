# Tim Holt's Powershell profile.
# Created in 2011 and heavily modified continuosly since then.
#
# This file is full of ‘*’ command ‘links’ __in_this_format. Maybe.
#
# Free to use for anyone


#│ ▼1 │ To-Do's  
#└────┴─────────
# TODO   Protect the Wide-Use Variables from editing!
# TODO   Put machine-dependant variables into the local machine's profile,
#        including paths to installed programs (with 'if' checks on whether
#        something is defined before messing with). Don't forget to put template
#        code in this file's comments!

#│ ▼1 │ Set-Up
#└─┬──┴─┬──────
  #│ ▼2 │ Prompt Options
  #└────┴────────────────
    Set-PSReadlineOption -EditMode Vi

  #│ ▼2 │ Code Page-ness
  #└────┴────────────────
    # From https://www.reddit.com/r/PowerShell/comments/3lym4q/cvalfcx
    
    function Set-CodePage
    {
      [CmdletBinding()]
      param( [ValidateSet("UTF8", "Default")] [string]$CodePage )

      $codePageToNum = @{ UTF8 = 65001; Default = 437; }

      chcp $codePageToNum[$CodePage] | Out-Null
    }

    if(Test-Path Env:ConEmuBuild)
    {
      Set-CodePage UTF8
    }

  #│ ▼2 │ Wide-Use Variables
  #└────┴────────────────────
    $progfilesx86 = ${env:ProgramFiles(x86)}
    $progfiles_manual = "C:\Program Files (Manually Installed)\"
    $all_progfiles = @($env:ProgramW6432, $progfilesx86, $progfiles_manual)

    $zzd = "~/local_code/zigzagdungeon/"
    $dropbox = "~/Dropbox/"
    $tempmine = "~/temp/"
    $inh = "~/Dropbox/timwrite/Book2/2016/inhuman_universe/"

    $minecraft_hidden = "C:\Users\Tim\AppData\Roaming\.minecraft"

    $my_scripts = "~\Dropbox\PowerShellScripts\"

    # Utility variables:
    $cpp_files = @("*.h", "*.cpp", "*.hpp")
    $vim_runtime = "~/Dropbox/Vim/GlobalRuntimePath/"
      # Resultant files of the "hg merge [branch] -t internal:dump" command.
    $dump_files = @("*.base", "*.local", "*.orig", "*.other")

    # cmdlet default parameters
    $ls_x = @{"Exclude" = ".*"}

    # small, shallow waf project automatic setup.
    $qproj = "C:/Users/Tim/Dropbox/PythonScripts/qproj.py"

  #│ ▼2 │ Path Augmentation
  #└────┴───────────────────
    # Note, this method of path augmentation goes away when powershell closes!
    # TODO: Put these in a list, log the ones that don’t exist! (and check & log already present)
    #if ($on_desktop)
    #{
    #  #$env:path = $env:path + ";C:\Program Files (x86)\Vim\vim74"
    #  $env:path = $env:path + ";C:\Program Files (Manually Installed)\doxys_1_15_win_bin"
    #  $env:path = $env:path + ";C:\MinGW\bin"
    #  $env:path = $env:path + ";C:\Program Files\MiKTeX 2.9\miktex\bin\x64"
    #}
    #elseif ($on_laptop)
    #{
    #  $env:path = $env:path + ";C:\Program Files\Vim\vim73\"
    #  $env:path = $env:path + ";C:\Program Files\TortoiseHg"
    #  $env:path = $env:path + ";C:\Program Files\SlikSvn\bin\"
    #  $env:path = $env:path + ";C:\MinGW\bin"
    #}

    #if ( $on_any_machine )
    #{
       $env:path = $env:path + ";" + $HOME + "\Dropbox\PowerShellScripts\"
       $env:path = $env:path + ";C:\Program Files\7-Zip\"
    #  # $env:path = $env:path + ";" + $progfiles_manual + "doxys\"
    #}

#│ ▼1 │ Utility
#└─┬──┴─┬───────
  #│ ▼2 │ Mappings (Key Bindings)
  #└────┴─────────────────────────
    # I was *wondering* why my leave-term-mode mapping in NeoVim wasn't working.
    # ...except this solved nothing. Powershell is a piece of crap.
    Remove-PSReadLineKeyHandler -Chord ctrl+spacebar
    Remove-PSReadLineKeyHandler -Chord ctrl+spacebar -ViMode Insert
    Remove-PSReadLineKeyHandler -Chord ctrl+spacebar -ViMode Command

    Set-PSReadlineKeyHandler -Key Tab -Function MenuComplete

  #│ ▼2 │ Aliases & Utility Functions
  #└─┬──┴─┬───────────────────────────
    #│ ▼3 │ Aliases
    #└────┴─────────
      Set-Alias v gvim

      Set-Alias p. Push-Location
      Set-Alias p Pop-Location

      # (Defined in next section:)
      Set-Alias p.s getlocationstack
      Set-Alias b battery

      Set-Alias _7z 7z

      Set-Alias python2 C:\Python27\python.exe

      # TODO Update to python 3.4 (Python33 was for the Vim installation I got)
      Set-Alias python3 C:\Program` Files\Python37\python.exe

      # Set-Alias c++ x86_64-w64-mingw32-c++
      # Set-Alias g++ x86_64-w64-mingw32-g++

      set-alias say out-speech

      set-alias vs "C:\Program Files (x86)\Microsoft Visual Studio\2019\Community\Common7\IDE\devenv.exe"

    #│ ▼3 │ Utility Functions
    #└────┴───────────────────
      function list_path
      {
        $a = $env:path; $a.Split(";")
      }

      function getlocationstack
      {
        Get-Location -Stack
      }

      function lds
      {
        if ( $on_any_machine )
        {
          C:\Program` Files\Intellectual` Reserve\LDS` View` 7.1\wcUView.exe
        }
      }

      # Run vim without a swap file.
      function vn
      {
        invoke-expression $("gvim -n")
      }

      function minecraft
      {
        if ( $on_desktop )
        {
          invoke-expression $("javaw -Xmx2048m -Xms1024m -jar `"C:\Program Files, manually installed\MineCraft\Minecraft.exe`"")
        }
        else
        {
          echo "You haven't set this up for this machine."
        }
      }

      function word
      {
        if ( $on_any_machine )
        {
          & ($office + "WINWORD.EXE")
        }
      }

      function hp([string]$topic)
      {
        # TODO: Find a Vim filetype spec for powershell help output
        invoke-expression $("get-help -full {0} | v -R -" -f $topic)
      }

      function hpf([string]$topic)
      {
        # TODO: Find a Vim filetype spec for powershell help output
        invoke-expression $("get-help -full {0} > ~/temp/cached_ps_help/{0}_help.txt" -f $topic)
      }

      function hghp([string]$topic)
      {
        # TODO: Find a Vim filetype spec for Mercurial help output
        invoke-expression $("hg -v help {0} | v -R -" -f $topic)
      }


      function battery
      {
        if ( $on_laptop )
        {
          write-output "Estimated Battery Remaining: $((get-WmiObject win32_battery).EstimatedChargeRemaining)%"
        }
        elseif ( $on_desktop )
        {
          write-output "You're on the desktop, you silly!"
        }
        else
        {
          write-output "lolwut?"
        }
      }

      # TODO perhaps multi-machine this
      function waf-light
      {
        python C:/development_resources/waf/waf-light $args
      }

      function waf
      {
        python C:/development_resources/waf/waf $args
      }

      #function lsx([string]$other_params)
      #{
      #  # TODO: This won't actually properly work yet.
      #  invoke-expression $("Get-ChildItem -Exclude .* {0}" -f $other_params)
      #  Get-ChildItem -Exclude .*
      #}

      function bash
      {
        ubuntu run
      }

      function sh([Parameter(ValueFromRemainingArguments)][string]$command)
      {
        invoke-expression $("ubuntu run {0}" -f $command)
      }

      function glog {Invoke-Expression "git log --all --graph --decorate --date=short-local --format=`"format:%Cblue%ad %h %Cred%d%Creset %s`""}

      $Shlwapi = Add-Type -MemberDefinition '
        [DllImport("Shlwapi.dll", CharSet=CharSet.Auto)]public static extern int StrFormatByteSize(long fileSize, System.Text.StringBuilder pwszBuff, int cchBuff);
      ' -Name "ShlwapiFunctions" -namespace ShlwapiFunctions -PassThru

      function Format-ByteSize([Long]$Size)
      {
        $Bytes = New-Object Text.StringBuilder 20
        $Return = $Shlwapi::StrFormatByteSize($Size, $Bytes, $Bytes.Capacity)
        If ($Return) {$Bytes.ToString()}
      }

      function ll
      {
        gci $args                                           `
        | Format-Table -AutoSize                            `
          Mode,                                             `
          @{                                                `
            Name='LastWriteTime';                           `
            Expression={                                    `
              $_.LastWriteTime.ToString('yyyy-MM-dd HH:mm') `
            }                                               `
          },                                                `
          @{                                                `
            Name='Size';                                    `
            Expression={                                    `
              Format-ByteSize($_.Length)                    `
            }                                               `
          },                                                `
          Name
      }

#│ ▼1 │ Prompt Line
#└────┴─────────────
function prompt
{
  # Default contents:
  #"PS $($executionContext.SessionState.Path.CurrentLocation)$('>' * ($nestedPromptLevel + 1)) "
  ## .Link
  ## http://go.microsoft.com/fwlink/?LinkID=225750
  ## .ExternalHelp System.Management.Automation.dll-help.xml

  # Refer to these sites for info:
  # http://technet.microsoft.com/en-us/library/hh847739.aspx

  #$saved_last_exit_code = $LastExitCode
  $the_history = $(get-history)
  $command_number = 1
  if ( $the_history.Length -ne 0 )
  {
    $command_number = $(get-history)[-1].id + 1
    Write-Host "`n" -NoNewLine
    #if ( $saved_last_exit_code -eq $null -or $saved_last_exit_code -eq 0 )
    #{
      #Write-Host "OK`n" -ForegroundColor "Green"
    #}
    #else
    #{
      #Write-Host "X $($saved_last_exit_code)`n" -ForegroundColor "Red"
    #}
  }

  # Abbreviate the home directory
  $prompt_path = $($executionContext.SessionState.Path.CurrentLocation)
  $prompt_path = $prompt_path -replace $($home -replace "\\", "\\"), "~"
  $prompt_path += "\"

  Write-Host $($prompt_path) -NoNewLine -ForegroundColor "Blue"

  # repo branch and status by color
  #▼
  #▲

  Write-Host "`n[" -ForegroundColor "darkgreen" -NoNewLine

  Write-Host "r $($command_number)" -ForegroundColor "blue" -NoNewLine
  Write-Host "] $('>' * ($nestedPromptLevel + 1))" -ForegroundColor "darkgreen" -NoNewLine

# Must return an object
  " "
}

#│ ▼1 │ Some automatic garbage I didn’t put here.
#└────┴───────────────────────────────────────────

# Chocolatey profile
$ChocolateyProfile = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
if (Test-Path($ChocolateyProfile)) {
  Import-Module "$ChocolateyProfile"
}

#┌────┬───────────────────────────────────────────
#│ ▲1 │ End


# vim: set fmr=▼,▲ fdm=marker cms=#%s et ts=2 sw=0 sts=0 :

