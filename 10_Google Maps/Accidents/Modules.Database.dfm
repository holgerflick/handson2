object DBController: TDBController
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 155
  Width = 188
  object QuDateLimits: TFDQuery
    Connection = Connection
    SQL.Strings = (
      'SELECT  '
      
        '  (SELECT start_date  FROM incidents ORDER BY start_date LIMIT 1' +
        ') first,'
      
        '  (SELECT start_date  FROM incidents ORDER BY start_date DESC LI' +
        'MIT 1) last ')
    Left = 95
    Top = 72
  end
  object Connection: TFDConnection
    Params.Strings = (
      'LockingMode=Normal'
      'ConnectionDef=accidents')
    ConnectedStoredUsage = []
    LoginPrompt = False
    Left = 63
    Top = 24
  end
  object QuStates: TFDQuery
    Connection = Connection
    SQL.Strings = (
      'SELECT State,Code FROM states ORDER BY code')
    Left = 23
    Top = 72
  end
end
