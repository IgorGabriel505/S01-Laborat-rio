data Etapa = NaFila | NoBanho | Concluido
  deriving (Show, Eq)

data Atendimento = Atendimento
  { cliente :: String
  , servico :: String
  , valor   :: Double
  , etapa   :: Etapa
  }

descrever :: Atendimento -> String
descrever at = cliente at ++ " - " ++ servico at ++ " - " ++ show (etapa at)

concluir :: Atendimento -> Atendimento
concluir at = at { etapa = Concluido }

arrecadado :: [Atendimento] -> Double
arrecadado atendimentos =
  sum (map valor (filter (\at -> etapa at == Concluido) atendimentos))

main :: IO ()
main = do
  let semRosto =
        Atendimento { cliente = "Sem-Rosto"
                    , servico = "Banho de ervas"
                    , valor   = 50.0
                    , etapa   = NaFila }
  let espiritoDoRio =
        Atendimento { cliente = "Espírito do Rio"
                    , servico = "Banho de limpeza profunda"
                    , valor   = 120.0
                    , etapa   = NoBanho }
  let deusRabanete =
        Atendimento { cliente = "Deus Rabanete"
                    , servico = "Banho quente"
                    , valor   = 30.0
                    , etapa   = NaFila }

  let atendimentos = [semRosto, espiritoDoRio, deusRabanete]
  let atualizados = [concluir semRosto, concluir espiritoDoRio, deusRabanete]

  putStrLn "--- Lista original ---"
  mapM_ putStrLn (map descrever atendimentos)
  putStrLn ("Arrecadado: R$ " ++ show (arrecadado atendimentos))

  putStrLn "--- Lista nova ---"
  mapM_ putStrLn (map descrever atualizados)
  putStrLn ("Arrecadado: R$ " ++ show (arrecadado atualizados))
