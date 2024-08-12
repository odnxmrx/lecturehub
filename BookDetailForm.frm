VERSION 5.00
Begin VB.Form BookDetailForm 
   Caption         =   "Book Detail"
   ClientHeight    =   7065
   ClientLeft      =   60
   ClientTop       =   405
   ClientWidth     =   10950
   LinkTopic       =   "Form1"
   ScaleHeight     =   7065
   ScaleWidth      =   10950
   StartUpPosition =   3  'Windows Default
   Begin VB.TextBox txtDescription 
      Height          =   1815
      Left            =   2040
      TabIndex        =   10
      Text            =   "Text5"
      Top             =   3720
      Width           =   4575
   End
   Begin VB.TextBox lblGenre 
      Height          =   495
      Left            =   2040
      TabIndex        =   9
      Text            =   "Text4"
      Top             =   3000
      Width           =   4575
   End
   Begin VB.TextBox Text3 
      Height          =   495
      Left            =   2040
      TabIndex        =   8
      Text            =   "Text3"
      Top             =   2160
      Width           =   4575
   End
   Begin VB.TextBox lblAuthor 
      Height          =   495
      Left            =   2040
      TabIndex        =   7
      Text            =   "Text2"
      Top             =   1440
      Width           =   4575
   End
   Begin VB.TextBox lblTitle 
      Height          =   495
      Left            =   2040
      TabIndex        =   6
      Text            =   "Text1"
      Top             =   480
      Width           =   4575
   End
   Begin VB.PictureBox BookPosterImage 
      Height          =   4095
      Left            =   7440
      ScaleHeight     =   4035
      ScaleWidth      =   2835
      TabIndex        =   5
      Top             =   600
      Width           =   2895
   End
   Begin VB.Label DescriptionLabel 
      Caption         =   "Description"
      Height          =   375
      Left            =   240
      TabIndex        =   4
      Top             =   3840
      Width           =   1455
   End
   Begin VB.Label GenreLabel 
      Caption         =   "Genre"
      Height          =   375
      Left            =   240
      TabIndex        =   3
      Top             =   3000
      Width           =   1575
   End
   Begin VB.Label PublishedDateLabel 
      Caption         =   "Published date"
      Height          =   375
      Left            =   360
      TabIndex        =   2
      Top             =   2160
      Width           =   1455
   End
   Begin VB.Label BookAuthorLabel 
      Caption         =   "Author"
      Height          =   375
      Left            =   360
      TabIndex        =   1
      Top             =   1440
      Width           =   1455
   End
   Begin VB.Label BookTitleLabel 
      Caption         =   "Title"
      Height          =   375
      Left            =   360
      TabIndex        =   0
      Top             =   480
      Width           =   1455
   End
End
Attribute VB_Name = "BookDetailForm"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
