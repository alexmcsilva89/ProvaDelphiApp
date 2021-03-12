object fTarefa3: TfTarefa3
  Left = 0
  Top = 0
  Caption = 'fTarefa3'
  ClientHeight = 377
  ClientWidth = 746
  Color = clBtnFace
  Constraints.MinHeight = 377
  Constraints.MinWidth = 746
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
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object pnPrincipal: TPanel
    Left = 0
    Top = 0
    Width = 746
    Height = 377
    Align = alClient
    TabOrder = 0
    object pnTotais: TPanel
      Left = 1
      Top = 266
      Width = 744
      Height = 110
      Align = alBottom
      BevelOuter = bvNone
      TabOrder = 0
      object pnBotoes: TPanel
        Left = 460
        Top = 0
        Width = 284
        Height = 110
        Align = alRight
        BevelOuter = bvNone
        TabOrder = 0
        object lblTotal: TLabel
          Left = 153
          Top = 12
          Width = 44
          Height = 13
          Caption = 'Total R$:'
        end
        object lblTotalDivisoes: TLabel
          Left = 153
          Top = 57
          Width = 85
          Height = 13
          Caption = 'Total divis'#245'es R$:'
        end
        object btnObterTotal: TButton
          Left = 34
          Top = 24
          Width = 107
          Height = 25
          Caption = 'Obter Total'
          TabOrder = 0
          OnClick = btnObterTotalClick
        end
        object edtTotal: TEdit
          Left = 153
          Top = 26
          Width = 121
          Height = 21
          TabOrder = 1
        end
        object btnObterTotalDivisoes: TButton
          Left = 10
          Top = 69
          Width = 131
          Height = 25
          Caption = 'Obter Total Divis'#245'es'
          TabOrder = 2
          OnClick = btnObterTotalDivisoesClick
        end
        object edtTotalDivisoes: TEdit
          Left = 153
          Top = 71
          Width = 121
          Height = 21
          TabOrder = 3
        end
      end
    end
    object pnValoresProjeto: TPanel
      Left = 1
      Top = 1
      Width = 744
      Height = 265
      Align = alClient
      BevelOuter = bvNone
      Padding.Left = 5
      Padding.Top = 5
      Padding.Right = 5
      Padding.Bottom = 5
      TabOrder = 1
      object lblValoresProjeto: TLabel
        Left = 5
        Top = 5
        Width = 734
        Height = 13
        Align = alTop
        Caption = 'Valores por projeto:'
        ExplicitWidth = 96
      end
      object grdValoresProjeto: TDBGrid
        Left = 5
        Top = 18
        Width = 734
        Height = 242
        Align = alClient
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            Title.Caption = 'IdProjeto'
            Visible = True
          end
          item
            Expanded = False
            Title.Caption = 'NomeProjeto'
            Width = 505
            Visible = True
          end
          item
            Expanded = False
            Title.Caption = 'Valor'
            Width = 103
            Visible = True
          end>
      end
    end
  end
end
