object DBController: TDBController
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 157
  Width = 185
  object Connection: TFDConnection
    Params.Strings = (
      'ConnectionDef=covid_usa')
    FetchOptions.AssignedValues = [evRecordCountMode]
    FetchOptions.RecordCountMode = cmTotal
    ConnectedStoredUsage = []
    Connected = True
    LoginPrompt = False
    Left = 32
    Top = 24
  end
  object QuCoordinates: TFDQuery
    Connection = Connection
    SQL.Strings = (
      'SELECT * FROM coordinates')
    Left = 32
    Top = 72
  end
  object QuCounties: TFDQuery
    Connection = Connection
    SQL.Strings = (
      'SELECT State, County FROM counties GROUP BY State, County')
    Left = 104
    Top = 72
  end
  object QuStates: TFDQuery
    Connection = Connection
    SQL.Strings = (
      'select distinct state from states order by state')
    Left = 104
    Top = 28
  end
end
