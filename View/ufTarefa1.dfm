object frmTarefa1: TfrmTarefa1
  Left = 0
  Top = 0
  Caption = 'frmTarefa1'
  ClientHeight = 377
  ClientWidth = 972
  Color = clBtnFace
  Constraints.MinHeight = 348
  Constraints.MinWidth = 972
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Visible = True
  WindowState = wsMaximized
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnPrincipal: TPanel
    Left = 0
    Top = 0
    Width = 972
    Height = 377
    Align = alClient
    TabOrder = 0
    object pnSQLGerado: TPanel
      Left = 1
      Top = 129
      Width = 970
      Height = 247
      Align = alClient
      Padding.Left = 10
      Padding.Top = 10
      Padding.Right = 10
      Padding.Bottom = 10
      TabOrder = 1
      object lblSQLGerado: TLabel
        Left = 11
        Top = 11
        Width = 948
        Height = 13
        Align = alTop
        Caption = 'SQL Gerado'
        ExplicitWidth = 57
      end
      object mSQLGerado: TMemo
        Left = 11
        Top = 24
        Width = 948
        Height = 212
        Align = alClient
        ReadOnly = True
        TabOrder = 0
      end
    end
    object pnSuperior: TPanel
      Left = 1
      Top = 1
      Width = 970
      Height = 128
      Align = alTop
      TabOrder = 0
      object pnColunas: TPanel
        Left = 1
        Top = 1
        Width = 256
        Height = 126
        Align = alLeft
        Padding.Left = 10
        Padding.Top = 10
        Padding.Right = 10
        Padding.Bottom = 10
        TabOrder = 0
        object lblColunas: TLabel
          Left = 11
          Top = 11
          Width = 234
          Height = 13
          Align = alTop
          Caption = 'Colunas'
          ExplicitWidth = 38
        end
        object mColunas: TMemo
          Left = 11
          Top = 24
          Width = 234
          Height = 91
          TabStop = False
          Align = alClient
          ScrollBars = ssVertical
          TabOrder = 0
        end
      end
      object pnTabelas: TPanel
        Left = 257
        Top = 1
        Width = 261
        Height = 126
        Align = alClient
        Padding.Left = 10
        Padding.Top = 10
        Padding.Right = 10
        Padding.Bottom = 10
        TabOrder = 1
        object lblTabelas: TLabel
          Left = 11
          Top = 11
          Width = 239
          Height = 13
          Align = alTop
          Caption = 'Tabelas'
          ExplicitWidth = 37
        end
        object mTabelas: TMemo
          Left = 11
          Top = 24
          Width = 239
          Height = 91
          Align = alClient
          ScrollBars = ssVertical
          TabOrder = 0
        end
      end
      object pnGeraSQL: TPanel
        Left = 760
        Top = 1
        Width = 209
        Height = 126
        Align = alRight
        TabOrder = 3
        object btnGeraSQL: TButton
          Left = 64
          Top = 51
          Width = 75
          Height = 25
          Caption = 'GeraSQL'
          TabOrder = 0
          OnClick = btnGeraSQLClick
        end
      end
      object pnCondicoes: TPanel
        Left = 518
        Top = 1
        Width = 242
        Height = 126
        Align = alRight
        Padding.Left = 10
        Padding.Top = 10
        Padding.Right = 10
        Padding.Bottom = 10
        TabOrder = 2
        object lblCondicoes: TLabel
          Left = 11
          Top = 11
          Width = 220
          Height = 13
          Align = alTop
          Caption = 'Condi'#231#245'es'
          ExplicitWidth = 49
        end
        object mCondicoes: TMemo
          Left = 11
          Top = 24
          Width = 220
          Height = 91
          Align = alClient
          ScrollBars = ssVertical
          TabOrder = 0
        end
      end
    end
  end
  object spQuery1: TspQuery
    SQL = ''
    Left = 65
    Top = 233
  end
end
