<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()> _
Partial Class MainPage
    Inherits System.Windows.Forms.Form

    'Form overrides dispose to clean up the component list.
    <System.Diagnostics.DebuggerNonUserCode()> _
    Protected Overrides Sub Dispose(ByVal disposing As Boolean)
        Try
            If disposing AndAlso components IsNot Nothing Then
                components.Dispose()
            End If
        Finally
            MyBase.Dispose(disposing)
        End Try
    End Sub

    'Required by the Windows Form Designer
    Private components As System.ComponentModel.IContainer

    'NOTE: The following procedure is required by the Windows Form Designer
    'It can be modified using the Windows Form Designer.  
    'Do not modify it using the code editor.
    <System.Diagnostics.DebuggerStepThrough()> _
    Private Sub InitializeComponent()
        Me.FirstDigit = New System.Windows.Forms.Label()
        Me.Button1 = New System.Windows.Forms.Button()
        Me.Oper = New System.Windows.Forms.Label()
        Me.SecondDigit = New System.Windows.Forms.Label()
        Me.Label1 = New System.Windows.Forms.Label()
        Me.Label2 = New System.Windows.Forms.Label()
        Me.LabelAns = New System.Windows.Forms.Label()
        Me.ButtonReset = New System.Windows.Forms.Button()
        Me.SuspendLayout()
        '
        'FirstDigit
        '
        Me.FirstDigit.AllowDrop = True
        Me.FirstDigit.AutoSize = True
        Me.FirstDigit.Font = New System.Drawing.Font("Arial", 69.75!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.FirstDigit.Location = New System.Drawing.Point(24, 62)
        Me.FirstDigit.Name = "FirstDigit"
        Me.FirstDigit.Size = New System.Drawing.Size(97, 108)
        Me.FirstDigit.TabIndex = 0
        Me.FirstDigit.Text = "0"
        '
        'Button1
        '
        Me.Button1.BackColor = System.Drawing.SystemColors.ControlDark
        Me.Button1.Enabled = False
        Me.Button1.Location = New System.Drawing.Point(106, 173)
        Me.Button1.Name = "Button1"
        Me.Button1.Size = New System.Drawing.Size(83, 26)
        Me.Button1.TabIndex = 1
        Me.Button1.Text = "Equals"
        Me.Button1.UseVisualStyleBackColor = False
        '
        'Oper
        '
        Me.Oper.AutoSize = True
        Me.Oper.Font = New System.Drawing.Font("Microsoft Sans Serif", 50.25!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.Oper.Location = New System.Drawing.Point(110, 77)
        Me.Oper.Name = "Oper"
        Me.Oper.Size = New System.Drawing.Size(71, 76)
        Me.Oper.TabIndex = 3
        Me.Oper.Text = "?"
        '
        'SecondDigit
        '
        Me.SecondDigit.AllowDrop = True
        Me.SecondDigit.AutoSize = True
        Me.SecondDigit.Font = New System.Drawing.Font("Arial", 69.75!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.SecondDigit.Location = New System.Drawing.Point(173, 62)
        Me.SecondDigit.Name = "SecondDigit"
        Me.SecondDigit.Size = New System.Drawing.Size(97, 108)
        Me.SecondDigit.TabIndex = 4
        Me.SecondDigit.Text = "0"
        '
        'Label1
        '
        Me.Label1.AutoSize = True
        Me.Label1.BackColor = System.Drawing.SystemColors.ControlDark
        Me.Label1.Font = New System.Drawing.Font("Microsoft Sans Serif", 15.75!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.Label1.Location = New System.Drawing.Point(22, 24)
        Me.Label1.Name = "Label1"
        Me.Label1.Size = New System.Drawing.Size(259, 25)
        Me.Label1.TabIndex = 5
        Me.Label1.Text = "Voice guided calculator"
        '
        'Label2
        '
        Me.Label2.AutoSize = True
        Me.Label2.BackColor = System.Drawing.SystemColors.ControlDarkDark
        Me.Label2.Font = New System.Drawing.Font("Microsoft Sans Serif", 15.75!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.Label2.Location = New System.Drawing.Point(18, 216)
        Me.Label2.Name = "Label2"
        Me.Label2.Size = New System.Drawing.Size(103, 25)
        Me.Label2.TabIndex = 6
        Me.Label2.Text = "Answer: "
        '
        'LabelAns
        '
        Me.LabelAns.AutoSize = True
        Me.LabelAns.Font = New System.Drawing.Font("Microsoft Sans Serif", 15.75!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.LabelAns.Location = New System.Drawing.Point(127, 216)
        Me.LabelAns.Name = "LabelAns"
        Me.LabelAns.Size = New System.Drawing.Size(0, 25)
        Me.LabelAns.TabIndex = 7
        '
        'ButtonReset
        '
        Me.ButtonReset.Location = New System.Drawing.Point(25, 260)
        Me.ButtonReset.Name = "ButtonReset"
        Me.ButtonReset.Size = New System.Drawing.Size(81, 24)
        Me.ButtonReset.TabIndex = 8
        Me.ButtonReset.Text = "Reset"
        Me.ButtonReset.UseVisualStyleBackColor = True
        '
        'Form1
        '
        Me.AutoScaleDimensions = New System.Drawing.SizeF(6.0!, 13.0!)
        Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
        Me.BackColor = System.Drawing.SystemColors.AppWorkspace
        Me.ClientSize = New System.Drawing.Size(293, 308)
        Me.Controls.Add(Me.ButtonReset)
        Me.Controls.Add(Me.LabelAns)
        Me.Controls.Add(Me.Label2)
        Me.Controls.Add(Me.Label1)
        Me.Controls.Add(Me.SecondDigit)
        Me.Controls.Add(Me.Oper)
        Me.Controls.Add(Me.Button1)
        Me.Controls.Add(Me.FirstDigit)
        Me.Name = "Form1"
        Me.Text = "Voice guided calculator"
        Me.ResumeLayout(False)
        Me.PerformLayout()

    End Sub
    Friend WithEvents FirstDigit As System.Windows.Forms.Label
    Friend WithEvents Button1 As System.Windows.Forms.Button
    Friend WithEvents Oper As System.Windows.Forms.Label
    Friend WithEvents SecondDigit As System.Windows.Forms.Label
    Friend WithEvents Label1 As System.Windows.Forms.Label
    Friend WithEvents Label2 As System.Windows.Forms.Label
    Friend WithEvents LabelAns As System.Windows.Forms.Label
    Friend WithEvents ButtonReset As System.Windows.Forms.Button

End Class
