object Data: TData
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
      'select * from locations')
    Left = 160
    Top = 32
  end
  object Racers: TFDQuery
    Connection = Connection
    SQL.Strings = (
      'select * from racers')
    Left = 160
    Top = 96
  end
end
