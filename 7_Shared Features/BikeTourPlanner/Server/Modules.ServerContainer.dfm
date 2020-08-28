object ServerContainer: TServerContainer
  OldCreateOrder = False
  Height = 103
  Width = 301
  object SparkleHttpSysDispatcher: TSparkleHttpSysDispatcher
    Left = 72
    Top = 16
  end
  object XDataServer: TXDataServer
    BaseUrl = 'http://+:80'
    Dispatcher = SparkleHttpSysDispatcher
    EntitySetPermissions = <>
    Left = 216
    Top = 16
    object XDataServerCORS: TSparkleCorsMiddleware
      Origin = '*'
    end
  end
end
