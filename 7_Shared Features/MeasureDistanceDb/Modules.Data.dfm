object DBController: TDBController
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 182
  Width = 241
  object Connection: TFDConnection
    Params.Strings = (
      'Database=D:\demo\FNCMaps\resources\db\racers.sqlite'
      'DriverID=SQLite')
    Connected = True
    LoginPrompt = False
    Left = 56
    Top = 32
  end
  object Locations: TFDQuery
    Connection = Connection
    SQL.Strings = (
      'select * from locations order by avgdistance')
    Left = 176
    Top = 48
  end
  object Racers: TFDQuery
    Connection = Connection
    SQL.Strings = (
      'select * from racers where clubid = :id')
    Left = 160
    Top = 96
    ParamData = <
      item
        Name = 'ID'
        DataType = ftInteger
        ParamType = ptInput
        Value = 33
      end>
  end
  object Clubs: TFDQuery
    Connection = Connection
    SQL.Strings = (
      
        'select id, no || '#39' - '#39' || rev(name) as name from clubs order by ' +
        'id')
    Left = 64
    Top = 96
  end
end
