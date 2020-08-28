object DbController: TDbController
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 207
  Width = 256
  object Connection: TFDConnection
    Params.Strings = (
      'ConnectionDef=storms')
    Connected = True
    LoginPrompt = False
    Left = 40
    Top = 40
  end
  object QuYears: TFDQuery
    Connection = Connection
    SQL.Strings = (
      'select * from years')
    Left = 40
    Top = 96
    object QuYearsYEAR: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'YEAR'
      Origin = 'YEAR'
      ProviderFlags = []
      ReadOnly = True
      Size = 32767
    end
  end
  object QuStorms: TFDQuery
    Connection = Connection
    SQL.Strings = (
      'select * from names_by_year where year = :year')
    Left = 120
    Top = 96
    ParamData = <
      item
        Name = 'YEAR'
        DataType = ftString
        ParamType = ptInput
        Value = '2017'
      end>
    object QuStormsSID: TStringField
      FieldName = 'SID'
      Origin = 'SID'
      Size = 32767
    end
    object QuStormsYEAR: TWideStringField
      FieldName = 'YEAR'
      Origin = 'YEAR'
      Size = 32767
    end
    object QuStormsNAME: TStringField
      FieldName = 'NAME'
      Origin = 'NAME'
      Size = 32767
    end
  end
  object QuTracks: TFDQuery
    Connection = Connection
    SQL.Strings = (
      'select * from named_locs where sid = :id')
    Left = 40
    Top = 152
    ParamData = <
      item
        Name = 'ID'
        DataType = ftString
        ParamType = ptInput
        Value = '2017152N14262'
      end>
  end
end
