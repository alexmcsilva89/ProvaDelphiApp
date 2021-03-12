object fTarefa2: TfTarefa2
  Left = 0
  Top = 0
  Caption = 'fTarefa2'
  ClientHeight = 362
  ClientWidth = 678
  Color = clBtnFace
  Constraints.MinHeight = 362
  Constraints.MinWidth = 678
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
  PixelsPerInch = 96
  TextHeight = 13
  object pnPrincipal: TPanel
    Left = 0
    Top = 0
    Width = 678
    Height = 362
    Align = alClient
    TabOrder = 0
    object pnThread2: TPanel
      Left = 1
      Top = 49
      Width = 676
      Height = 47
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 1
      object lblThread2: TLabel
        Left = 41
        Top = 0
        Width = 43
        Height = 13
        Align = alLeft
        Caption = 'Thread 2'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object speMiliSegundos2: TSpinEdit
        Left = 0
        Top = 0
        Width = 41
        Height = 22
        Align = alLeft
        MaxValue = 0
        MinValue = 0
        TabOrder = 0
        Value = 0
      end
      object pbThread2: TProgressBar
        Left = 0
        Top = 21
        Width = 676
        Height = 26
        Align = alBottom
        TabOrder = 1
      end
    end
    object pnThread1: TPanel
      Left = 1
      Top = 1
      Width = 676
      Height = 48
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 0
      object lblThread1: TLabel
        Left = 41
        Top = 0
        Width = 43
        Height = 13
        Align = alLeft
        Caption = 'Thread 1'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object pbThread1: TProgressBar
        Left = 0
        Top = 21
        Width = 676
        Height = 27
        Align = alBottom
        TabOrder = 1
      end
      object speMiliSegundos1: TSpinEdit
        Left = 0
        Top = 0
        Width = 41
        Height = 22
        Align = alLeft
        MaxValue = 0
        MinValue = 0
        TabOrder = 0
        Value = 0
      end
    end
    object pnExecutar: TPanel
      Left = 1
      Top = 96
      Width = 676
      Height = 65
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 2
      object btnThread: TButton
        Left = 0
        Top = 32
        Width = 676
        Height = 33
        Align = alBottom
        Caption = 'Executar'
        TabOrder = 0
        OnClick = btnThreadClick
      end
    end
  end
end
