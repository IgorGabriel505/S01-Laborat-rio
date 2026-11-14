pesoMaximo :: Double
pesoMaximo = 5.0
-- pesoMaximo = 8.0

data Encomenda = Encomenda
  { destinatario :: String
  , peso         :: Double
  , frete        :: Double
  }

descrever :: Encomenda -> String
descrever enc =
  destinatario enc ++ " - " ++ show (peso enc) ++ " kg - frete R$ " ++ show (frete enc)

cabemNaVassoura :: [Encomenda] -> [Encomenda]
cabemNaVassoura encomendas = filter (\enc -> peso enc <= pesoMaximo) encomendas

totalDeFretes :: [Encomenda] -> Double
totalDeFretes encomendas = sum (map frete encomendas)

main :: IO ()
main = do
  let encomendas =
        [ Encomenda { destinatario = "Osono", peso = 2.5, frete = 15.0 }
        , Encomenda { destinatario = "Ursula", peso = 7.0, frete = 30.0 }
        , Encomenda { destinatario = "Tombo", peso = 1.0, frete = 10.0 }
        , Encomenda { destinatario = "Senhora da torta de arenque", peso = 4.0, frete = 20.0 }
        , Encomenda { destinatario = "Fukuo", peso = 9.5, frete = 40.0 }
        ]

  let cabem = cabemNaVassoura encomendas

  putStrLn "--- Todas as encomendas ---"
  mapM_ putStrLn (map descrever encomendas)
  putStrLn "--- Cabem na vassoura ---"
  mapM_ putStrLn (map descrever cabem)
  putStrLn ("Total de fretes: R$ " ++ show (totalDeFretes cabem))
