VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Begin VB.Form LectureHubFormMain 
   Caption         =   "Lecture Hub Project"
   ClientHeight    =   7905
   ClientLeft      =   165
   ClientTop       =   810
   ClientWidth     =   13410
   LinkTopic       =   "Form1"
   ScaleHeight     =   17905
   ScaleMode       =   0  'User
   ScaleWidth      =   13410
   StartUpPosition =   3  'Windows Default
   Begin MSComctlLib.ListView BookListView 
      Height          =   5415
      Left            =   600
      TabIndex        =   2
      Top             =   1800
      Width           =   8775
      _ExtentX        =   15478
      _ExtentY        =   9551
      View            =   3
      LabelWrap       =   -1  'True
      HideSelection   =   -1  'True
      _Version        =   393217
      ForeColor       =   -2147483640
      BackColor       =   -2147483643
      BorderStyle     =   1
      Appearance      =   1
      NumItems        =   0
   End
   Begin VB.CommandButton AddReadLater 
      Caption         =   "Add To Read Later"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   12
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   495
      Left            =   9480
      TabIndex        =   1
      Top             =   3840
      Width           =   2175
   End
   Begin VB.CommandButton AddFavBtn 
      Caption         =   "Save To Favorites"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   12
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   495
      Left            =   9480
      TabIndex        =   0
      Top             =   3120
      Width           =   2175
   End
   Begin VB.Label SubTitleLabel 
      Caption         =   "Browse our books collection:"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   12
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   600
      TabIndex        =   4
      Top             =   1200
      Width           =   3015
   End
   Begin VB.Label TitleLabel 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      BackStyle       =   0  'Transparent
      Caption         =   "Lecture Hub"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   14.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   375
      Left            =   720
      TabIndex        =   3
      Top             =   240
      Width           =   3375
   End
   Begin VB.Menu Archivo 
      Caption         =   "File"
      Begin VB.Menu Preferences 
         Caption         =   "Preferences"
      End
      Begin VB.Menu Exit 
         Caption         =   "Exit"
      End
   End
   Begin VB.Menu Help 
      Caption         =   "Ayuda"
      Begin VB.Menu Contact 
         Caption         =   "Contacto"
      End
   End
End
Attribute VB_Name = "LectureHubFormMain"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
' Declare conn at the top of your form module
Private conn As ADODB.Connection

Private Sub Exit_Click()
    Unload Me
End Sub

Private Sub Form_Load()
    Dim rs As ADODB.Recordset
    Set rs = New ADODB.Recordset
    
    Call ConnectToDb
    
    ' Ensure conn is initialized before checking its state
    If Not conn Is Nothing Then
        If conn.State = adStateOpen Then
            On Error GoTo ErrorHandler
            rs.Open "SELECT * FROM Books", conn, adOpenStatic, adLockReadOnly
            ' Additional code to handle the recordset data
            
            ' Clear the ListView before populating it
            With BookListView
                .View = lvwReport ' Set the ListView to report view to use columns
                .ColumnHeaders.Clear
                .ColumnHeaders.Add , , "Id", 500 ' Add columns with a specified width
                .ColumnHeaders.Add , , "Title", 1000 ' Add columns with a specified width
                .ColumnHeaders.Add , , "Description", 2000
                .ColumnHeaders.Add , , "Author", 1500
                .ColumnHeaders.Add , , "Genre", 1500
            End With

            
            ' Loop through the recordset and populate the ListView
            Do While Not rs.EOF
                Dim Item As ListItem
                Set Item = BookListView.ListItems.Add(, , rs![bookId])
                
                ' Ensure you have columns defined in the ListView for these SubItems
                Item.SubItems(1) = CStr(rs!Title) ' Ensure conversion to string
                Item.SubItems(2) = CStr(rs!Description) ' Ensure conversion to string
                Item.SubItems(3) = CStr(rs!Author)
                Item.SubItems(4) = CStr(rs!Genre)
                
                rs.MoveNext
            Loop
            
            Call DisconnectToDb ' Close my conn
            Exit Sub
        End If
    Else
        MsgBox "Connection object not initialized.", vbCritical
    End If

ErrorHandler:
    MsgBox "Error: " & Err.Description, vbCritical
    Exit Sub
End Sub


' List detail
Private Sub BookListView_ItemClick(ByVal Item As MSComctlLib.ListItem)
    ' Create an instance of the details form
    Dim frmDetails As New BookDetailForm
    
    ' Pass the data to the form's public properties or controls
    frmDetails.lblTitle.Text = Item.Text ' Assuming the title is the main item text
    frmDetails.txtDescription.Text = Item.SubItems(1) ' Description
    frmDetails.lblAuthor.Text = Item.SubItems(2) ' Author
    frmDetails.lblGenre.Text = Item.SubItems(3) ' Genre
    
    ' Show the details form
    frmDetails.Show
End Sub



Public Sub ConnectToDb()
    Set conn = New ADODB.Connection
    conn.ConnectionString = "Provider=SQLOLEDB; Data Source=.; Initial Catalog=LectureHubDb; Trusted_Connection=Yes;"
    conn.Open
End Sub

Public Sub DisconnectToDb()
    If Not conn Is Nothing Then
        conn.Close
        Set conn = Nothing
    End If
End Sub

