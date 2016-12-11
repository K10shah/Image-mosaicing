Imports System.Speech

Public Class MainPage

    Dim WithEvents reco As New Recognition.SpeechRecognitionEngine
    Dim first As Integer = 0
    Dim firstFlag As Boolean = False
    Dim second As Integer = 0
    Dim secondFlag As Boolean = False
    Dim sign As String = ""
    Dim signFlag As Boolean = False
    Dim choice As String = ""
    Private Sub SetColor(ByVal color As System.Drawing.Color)

        'Dim synth As New Synthesis.SpeechSynthesizer

        'synth.SpeakAsync("setting the back color to " + color.ToString)

        Me.BackColor = color

    End Sub


    Private Sub Form1_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load

        Button1.Visible = False
        reco.SetInputToDefaultAudioDevice()

        Dim gram As New Recognition.SrgsGrammar.SrgsDocument

        Dim colorRule As New Recognition.SrgsGrammar.SrgsRule("color")

        Dim colorsList As New Recognition.SrgsGrammar.SrgsOneOf("1", "2", "3", "4", "5", "6", "7", "9", "0", "+", "minus", "divide", "*", "multiply", "plus", "add", "subtract", "divided by", "multiplied by", "into")

        colorRule.Add(colorsList)

        gram.Rules.Add(colorRule)

        gram.Root = colorRule

        reco.LoadGrammar(New Recognition.Grammar(gram))

        reco.RecognizeAsync()

    End Sub

    Private Sub reco_RecognizeCompleted(ByVal sender As Object, ByVal e As System.Speech.Recognition.RecognizeCompletedEventArgs) Handles reco.RecognizeCompleted

        reco.RecognizeAsync()

    End Sub

    Private Sub reco_SpeechRecognized(ByVal sender As Object, ByVal e As System.Speech.Recognition.RecognitionEventArgs) Handles reco.SpeechRecognized
        Console.Write(e.Result.Text)
        choice = e.Result.Text
        If firstFlag = False Then
            Select Case choice
                Case "0"
                    FirstDigit.Text = 0
                    first = 0
                    firstFlag = True
                Case "1"
                    FirstDigit.Text = 1
                    first = 1
                    firstFlag = True
                Case "2"
                    FirstDigit.Text = 2
                    first = 2
                    firstFlag = True
                Case "3"
                    FirstDigit.Text = 3
                    first = 3
                    firstFlag = True
                Case "4"
                    FirstDigit.Text = 4
                    first = 4
                    firstFlag = True
                Case "5"
                    FirstDigit.Text = 5
                    first = 5
                    firstFlag = True
                Case "6"
                    FirstDigit.Text = 6
                    first = 6
                    firstFlag = True
                Case "7"
                    FirstDigit.Text = 7
                    first = 7
                    firstFlag = True
                Case "8"
                    FirstDigit.Text = 8
                    first = 8
                    firstFlag = True
                Case "9"
                    FirstDigit.Text = 9
                    first = 9
                    firstFlag = True
            End Select


        ElseIf signFlag = False Then
            Select Case choice
                Case "plus"
                    Oper.Text = "+"
                    sign = "+"
                    signFlag = True
                Case "add"
                    Oper.Text = "+"
                    sign = "+"
                    signFlag = True
                Case "divide"
                    Oper.Text = "/"
                    sign = "/"
                    signFlag = True
                Case "divided by"
                    Oper.Text = "/"
                    sign = "/"
                    signFlag = True
                Case "minus"
                    Oper.Text = "-"
                    sign = "-"
                    signFlag = True
                Case "subtract"
                    Oper.Text = "-"
                    sign = "-"
                    signFlag = True
                Case "*"
                    Oper.Text = "X"
                    sign = "X"
                    signFlag = True
                Case "multiplied by"
                    Oper.Text = "X"
                    sign = "X"
                    signFlag = True
                Case "into"
                    Oper.Text = "X"
                    sign = "X"
                    signFlag = True
                Case "multiply"
                    Oper.Text = "X"
                    sign = "X"
                    signFlag = True
            End Select
        ElseIf secondFlag = False Then
            Select Case choice
                Case "0"
                    SecondDigit.Text = 0
                    second = 0
                    secondFlag = True
                Case "1"
                    SecondDigit.Text = 1
                    second = 1
                    secondFlag = True
                Case "2"
                    SecondDigit.Text = 2
                    second = 2
                    secondFlag = True
                Case "3"
                    SecondDigit.Text = 3
                    second = 3
                    secondFlag = True
                Case "4"
                    SecondDigit.Text = 4
                    second = 4
                    secondFlag = True
                Case "5"
                    SecondDigit.Text = 5
                    second = 5
                    secondFlag = True
                Case "6"
                    SecondDigit.Text = 6
                    second = 6
                    secondFlag = True
                Case "7"
                    SecondDigit.Text = 7
                    second = 7
                    secondFlag = True
                Case "8"
                    SecondDigit.Text = 8
                    second = 8
                    secondFlag = True
                Case "9"
                    SecondDigit.Text = 9
                    second = 9
                    secondFlag = True
            End Select
            Button1.Visible = True
            Button1.Enabled = True
        End If

    End Sub


    Private Sub Button1_Click(sender As System.Object, e As System.EventArgs) Handles Button1.Click
        Select Case sign
            Case "+"
                LabelAns.Text = (first + second).ToString()
            Case "-"
                LabelAns.Text = (first - second).ToString()
            Case "/"
                If second = 0 Then
                    LabelAns.Text = "Invalid input"
                Else
                    LabelAns.Text = (first / second).ToString()
                End If
            Case "X"
                LabelAns.Text = (first * second).ToString()
        End Select
        Button1.Visible = False
        Button1.Enabled = False
    End Sub

    Private Sub ButtonReset_Click(sender As System.Object, e As System.EventArgs) Handles ButtonReset.Click
        first = 0
        firstFlag = False
        FirstDigit.Text = "0"
        second = 0
        secondFlag = False
        SecondDigit.Text = "0"
        Oper.Text = "?"
        sign = ""
        signFlag = False
        Button1.Visible = False
        Button1.Enabled = False
        LabelAns.Text = ""
    End Sub
End Class