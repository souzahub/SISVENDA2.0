object formBuscaProduto: TformBuscaProduto
  Left = 200
  Top = 208
  ClientHeight = 420
  ClientWidth = 697
  Caption = ''
  Color = clNone
  BorderStyle = bsNone
  OldCreateOrder = False
  BorderIcons = []
  MonitoredKeys.Keys = <>
  OnCreate = UniFormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object UniDBGrid1: TUniDBGrid
    AlignWithMargins = True
    Left = 5
    Top = 87
    Width = 687
    Height = 330
    Hint = ''
    Margins.Left = 5
    Margins.Right = 5
    DataSource = dsProduto
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgTitleClick, dgFilterClearButton, dgAutoRefreshRow]
    LoadMask.Message = 'Loading data...'
    ForceFit = True
    BorderStyle = ubsNone
    Align = alClient
    TabOrder = 0
    ParentColor = False
    Color = clWindow
    OnDblClick = UniDBGrid1DblClick
    Columns = <
      item
        FieldName = 'ID'
        Title.Caption = 'Cod'
        Width = 56
      end
      item
        FieldName = 'DESCRICAO'
        Title.Caption = 'DESCRICAO'
        Width = 464
      end
      item
        FieldName = 'VALOR'
        Title.Caption = 'VALOR'
        Width = 129
      end>
  end
  object UniPanel1: TUniPanel
    Left = 0
    Top = 0
    Width = 697
    Height = 36
    Hint = ''
    Align = alTop
    ParentFont = False
    Font.Height = -20
    TabOrder = 1
    Caption = 'Produtos'
  end
  object UniPanel2: TUniPanel
    AlignWithMargins = True
    Left = 5
    Top = 39
    Width = 687
    Height = 42
    Hint = ''
    Margins.Left = 5
    Margins.Right = 5
    Align = alTop
    ParentFont = False
    Font.Color = clBlack
    Font.Height = -20
    Font.Style = [fsBold]
    TabOrder = 2
    BorderStyle = ubsNone
    Caption = ''
    Color = clNone
    object UniLabel8: TUniLabel
      Left = 784
      Top = 24
      Width = 6
      Height = 24
      Hint = ''
      Visible = False
      Caption = '.'
      TabOrder = 1
    end
    object EdPesquisar: TUniEdit
      AlignWithMargins = True
      Left = 10
      Top = 5
      Width = 575
      Height = 35
      Hint = ''
      Margins.Left = 10
      Margins.Top = 5
      Margins.Bottom = 2
      ParentShowHint = False
      CharCase = ecUpperCase
      MaxLength = 40
      Text = ''
      ParentFont = False
      Font.Color = clBlack
      Font.Style = [fsBold]
      Align = alLeft
      TabOrder = 2
      EmptyText = 'PESQUISAR'
      ClearButton = True
      FieldLabel = '<i class="fas fa-search"></i>'
      FieldLabelWidth = 20
      FieldLabelSeparator = ' '
      FieldLabelFont.Height = -19
      FieldLabelFont.Style = [fsBold]
      OnChange = EdPesquisarChange
    end
    object ubtSair: TUniFSButton
      AlignWithMargins = True
      Left = 615
      Top = 6
      Width = 30
      Height = 30
      Hint = ''
      Margins.Left = 4
      Margins.Top = 6
      Margins.Right = 4
      Margins.Bottom = 6
      StyleButton = GoogleBlue3Round
      BadgeText.Text = '0'
      BadgeText.TextColor = '#FFFFFF'
      BadgeText.TextSize = 10
      BadgeText.TextStyle = 'bold'
      BadgeText.BackgroundColor = '#D50000'
      Caption = ''
      Align = alRight
      ParentFont = False
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Roboto'
      Font.Style = [fsBold]
      TabOrder = 3
      ClientEvents.Enabled = False
      Images = UniNativeImageList1
      ImageIndex = 25
      OnClick = ubtSairClick
    end
    object btCancelar: TUniFSButton
      AlignWithMargins = True
      Left = 653
      Top = 6
      Width = 30
      Height = 30
      Hint = ''
      Margins.Left = 4
      Margins.Top = 6
      Margins.Right = 4
      Margins.Bottom = 6
      StyleButton = GoogleBlue3Round
      BadgeText.Text = '0'
      BadgeText.TextColor = '#FFFFFF'
      BadgeText.TextSize = 10
      BadgeText.TextStyle = 'bold'
      BadgeText.BackgroundColor = '#D50000'
      Caption = ''
      Align = alRight
      ParentFont = False
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Roboto'
      Font.Style = [fsBold]
      TabOrder = 4
      ClientEvents.Enabled = False
      Images = UniNativeImageList1
      ImageIndex = 26
      OnClick = btCancelarClick
    end
  end
  object dsProduto: TDataSource
    DataSet = dmDados.QueryProduto
    Left = 120
    Top = 272
  end
  object UniNativeImageList1: TUniNativeImageList
    Left = 48
    Top = 392
    Images = {
      1B00000000000000060B0000006E617669636F6E3B66613B00000000060B0000
      006465736B746F703B66613B00000000060C000000656E76656C6F70653B6661
      3B000000000608000000757365723B66613B00000000060E0000006C696E652D
      63686172743B66613B00000000061000000077696E646F772D636C6F73653B66
      613B000000000608000000736176653B66613B00000000060800000065646974
      3B66613B0000000006070000006375743B66613B00000000060D000000626172
      2D63686172743B66613B00000000060D0000007069652D63686172743B66613B
      000000000610000000616464726573732D636172643B66613B00000000060C00
      000063616C656E6461723B66613B000000000608000000666565643B66613B00
      00000006070000006661783B66613B000000000609000000696D6167653B6661
      3B000000000609000000696E626F783B66613B00000000060D0000006261722D
      63686172743B66613B00000000060B00000069642D636172643B66613B000000
      00060D000000757365722D706C75733B66613B00000000060900000074727563
      6B3B66613B00000000060900000075736572733B66613B00000000060C000000
      7369676E2D6F75743B66613B00000000060E000000756E69766572736974793B
      66613B00000000060C00000064617461626173653B66613B0000000006080000
      00706C75733B66613B00000000060900000074696D65733B66613B}
  end
end
