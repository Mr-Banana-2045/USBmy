Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

$form = New-Object Windows.Forms.Form
$form.Text = "USBmy"
$form.Size = New-Object Drawing.Size(500, 400)
$form.BackColor = 'White'
$form.MaximizeBox = $false
$form.FormBorderStyle = [System.Windows.Forms.FormBorderStyle]::FixedSingle


$but = New-Object System.Windows.Forms.Button
$but.Location = New-Object System.Drawing.Point(150, 100)
$but.Size = New-Object System.Drawing.Size(200,50)
$but.Font = New-Object Drawing.Font("Microsoft Sans Serif", 13, [Drawing.FontStyle]::Bold)
$but.Text = "Recovery"
$but.Add_Click({
    $form.Close()
    NextPage1
})
function NextPage1 {
    $form1 = New-Object System.Windows.Forms.Form
    $form1.Size = New-Object Drawing.Size(500, 300)
    $form1.Text = "Recovery"
    $form1.MaximizeBox = $false
    $form1.FormBorderStyle = [System.Windows.Forms.FormBorderStyle]::FixedSingle

    $label = New-Object Windows.Forms.Label
    $label.Text = "USB Recovery"
    $label.AutoSize = $true
    $label.ForeColor = "Black"
    $label.Location = New-Object System.Drawing.Point(130, 20)
    $label.Font = New-Object Drawing.Font("Microsoft Sans Serif", 24, [Drawing.FontStyle]::Bold)
    $form1.Controls.Add($label)

    $label2 = New-Object Windows.Forms.Label
    $label2.Text = "Select Drive"
    $label2.ForeColor = "Gray"
    $label2.AutoSize = $true
    $label2.Location = New-Object System.Drawing.Point(140, 70)
    $label2.Font = New-Object Drawing.Font("Microsoft Sans Serif", 10, [Drawing.FontStyle]::Bold)
    $form1.Controls.Add($label2)

    $comboBox = New-Object System.Windows.Forms.ComboBox
    $comboBox.Location = New-Object System.Drawing.Point(140, 90)
    $comboBox.Width = 200
    $form1.Controls.Add($comboBox)

    $drives = Get-WmiObject Win32_LogicalDisk | Where-Object { $_.DriveType -eq 2 }
    foreach ($drive in $drives) {
        $comboBox.Items.Add($drive.DeviceID)
    }
        
    $label111 = New-Object Windows.Forms.Label
    $label111.AutoSize = $true
    $label111.ForeColor = "Green"
    $label111.Location = New-Object System.Drawing.Point(140, 180)
    $label111.Font = New-Object Drawing.Font("Microsoft Sans Serif", 10, [Drawing.FontStyle]::Bold)
    $form1.Controls.Add($label111)

    $Button = New-Object System.Windows.Forms.Button
    $Button.Location = New-Object System.Drawing.Size(140,130)
    $Button.Size = New-Object System.Drawing.Size(200,50)
    $Button.Font = New-Object Drawing.Font("Microsoft Sans Serif", 13, [Drawing.FontStyle]::Bold)
    $Button.Padding = New-Object System.Windows.Forms.Padding(5)
    $Button.Text = "Recovery"
    $Button.ForeColor = 'black'
    $Button.BackColor = 'white'
    $form1.Controls.Add($Button)
    $Button.Add_Click({
        ATTRIB -H -R -S /S /D $comboBox.SelectedItem:*.*
        $label111.Text = "It was successful"
    })
    $form1.Controls.Add($Button)
    $form1.ShowDialog()
}
$form.Controls.Add($but)

$butts = New-Object System.Windows.Forms.Button
$butts.Location = New-Object System.Drawing.Point(150, 170)
$butts.Size = New-Object System.Drawing.Size(200,50)
$butts.Font = New-Object Drawing.Font("Microsoft Sans Serif", 13, [Drawing.FontStyle]::Bold)
$butts.Text = "Repair"
$butts.Add_Click({
    $form.Close()
    NextPage2
})

function NextPage2 {
    $form2 = New-Object System.Windows.Forms.Form
    $form2.Size = New-Object Drawing.Size(500, 400)
    $form2.Text = "Repair"
    $form2.MaximizeBox = $false
    $form2.FormBorderStyle = [System.Windows.Forms.FormBorderStyle]::FixedSingle

    $label1 = New-Object Windows.Forms.Label
    $label1.Text = "USB Repair"
    $label1.AutoSize = $true
    $label1.ForeColor = "Black"
    $label1.Location = New-Object System.Drawing.Point(150, 20)
    $label1.Font = New-Object Drawing.Font("Microsoft Sans Serif", 24, [Drawing.FontStyle]::Bold)
    $form2.Controls.Add($label1)
    
    $label3 = New-Object Windows.Forms.Label
    $label3.Text = "Select Drive"
    $label3.ForeColor = "Gray"
    $label3.AutoSize = $true
    $label3.Location = New-Object System.Drawing.Point(140, 70)
    $label3.Font = New-Object Drawing.Font("Microsoft Sans Serif", 10, [Drawing.FontStyle]::Bold)
    $form2.Controls.Add($label3)
    
    $comboBox2 = New-Object System.Windows.Forms.ComboBox
    $comboBox2.Location = New-Object System.Drawing.Point(140, 90)
    $comboBox2.Width = 200
    $form2.Controls.Add($comboBox2)

    $drivess = Get-WmiObject Win32_LogicalDisk | Where-Object { $_.DriveType -eq 2 }
    foreach ($drivesss in $drivess) {
        $comboBox2.Items.Add($drivesss.DeviceID)
    }
    
    $label11 = New-Object Windows.Forms.Label
    $label11.AutoSize = $true
    $label11.ForeColor = "Green"
    $label11.Location = New-Object System.Drawing.Point(140, 250)
    $label11.Font = New-Object Drawing.Font("Microsoft Sans Serif", 10, [Drawing.FontStyle]::Bold)
    $form2.Controls.Add($label11)

    $Buttoo = New-Object System.Windows.Forms.Button
    $Buttoo.Location = New-Object System.Drawing.Point(140,130)
    $Buttoo.Size = New-Object System.Drawing.Size(200,50)
    $Buttoo.Font = New-Object Drawing.Font("Microsoft Sans Serif", 13, [Drawing.FontStyle]::Bold)
    $Buttoo.Text = "add file"
    $Buttoo.Add_Click({
        $FileDialog = New-Object System.Windows.Forms.OpenFileDialog
        $FileDialog.Filter = "All files (*.*)|*.*"
        $Result = $FileDialog.ShowDialog()
        if ($Result -eq [System.Windows.Forms.DialogResult]::OK) {
            $Button1 = New-Object System.Windows.Forms.Button
            $Button1.Location = New-Object System.Drawing.Size(140,200)
            $Button1.Size = New-Object System.Drawing.Size(200,50)
            $Button1.Font = New-Object Drawing.Font("Microsoft Sans Serif", 13, [Drawing.FontStyle]::Bold)
            $Button1.Padding = New-Object System.Windows.Forms.Padding(5)
            $Button1.Text = "Repair"
            $Button1.ForeColor = 'black'
            $Button1.BackColor = 'white'
            $Button1.Add_Click({
                $msdh = $FileDialog.FileName
                Start-Process cmd -Verb RunAs -ArgumentList "/c diskpart /s $msdh"
                $label11.Text = "It was successful"
            })
            $form2.Controls.Add($Button1)
        }
    })
    $form2.Controls.Add($Buttoo)
    $form2.ShowDialog()
}
$form.Controls.Add($butts)

$text = New-Object Windows.Forms.Label
$text.Text = "USB repairs"
$text.AutoSize = $true
$text.ForeColor = "Black"
$text.Location = New-Object System.Drawing.Point(150, 50)
$text.Font = New-Object Drawing.Font("Microsoft Sans Serif", 24, [Drawing.FontStyle]::Bold)
$form.Controls.Add($text)

$textt = New-Object Windows.Forms.Label
$textt.Text = "GITHUB > Mr-Banana-2045"
$textt.AutoSize = $true
$textt.ForeColor = "Green"
$textt.Location = New-Object System.Drawing.Point(160, 250)
$textt.Font = New-Object Drawing.Font("Microsoft Sans Serif", 10, [Drawing.FontStyle]::Bold)
$form.Controls.Add($textt)

$texttt = New-Object Windows.Forms.Label
$texttt.Text = "Channel > vnas_pr"
$texttt.AutoSize = $true
$texttt.ForeColor = "Blue"
$texttt.Location = New-Object System.Drawing.Point(190, 280)
$texttt.Font = New-Object Drawing.Font("Microsoft Sans Serif", 10, [Drawing.FontStyle]::Bold)
$form.Controls.Add($texttt)

$form.ShowDialog()