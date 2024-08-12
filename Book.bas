Attribute VB_Name = "Book"
Public Sub ConnectToDb2()

    On Error GoTo ErrorHandler
    Set conn = New ADODB.Connection
         conn.ConnectionString = "Provider=SQLOLEDB; Data Source=localhost; Initial Catalog=LectureHubDb; Integrated Security=SSPI;"
        conn.Open ConnectionString
    Exit Sub

ErrorHandler:
    MsgBox "Eror de Conexion a DB. Error: " & Err.Description, vbCritical
End Sub


    Public Sub DisconnectToDb()
        If Not conn Is Nothing Then
            conn.Close
            Set conn = Nothing
        End If
    End Sub

