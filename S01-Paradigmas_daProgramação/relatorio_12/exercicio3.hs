data Esboco = Esboco
  { titulo  :: String
  , tecnica :: String
  , horas   :: Int
  }

esbocoMaisRecente :: [Esboco] -> String
esbocoMaisRecente []    = "O caderno está vazio."
esbocoMaisRecente (e:_) = "Mais recente: " ++ titulo e ++ " (" ++ tecnica e ++ ")"

contarEsbocos :: [Esboco] -> Int
contarEsbocos []        = 0
contarEsbocos (_:resto) = 1 + contarEsbocos resto

horasDesenhando :: [Esboco] -> Int
horasDesenhando []        = 0
horasDesenhando (e:resto) = horas e + horasDesenhando resto

main :: IO ()
main = do
  let caderno =
        [ Esboco { titulo = "Ruínas da catedral", tecnica = "nanquim", horas = 5 }
        , Esboco { titulo = "Criatura do pântano", tecnica = "grafite", horas = 3 }
        , Esboco { titulo = "Floresta na névoa", tecnica = "carvão", horas = 4 }
        ]

  putStrLn (esbocoMaisRecente caderno)
  putStrLn ("Número de esboços: " ++ show (contarEsbocos caderno))
  putStrLn ("Total de horas: " ++ show (horasDesenhando caderno))
  putStrLn (esbocoMaisRecente [])

  let torre = Esboco { titulo = "Torre abandonada", tecnica = "nanquim", horas = 6 }
  let cadernoNovo = torre : caderno

  putStrLn "--- Caderno anterior ---"
  putStrLn (esbocoMaisRecente caderno)
  putStrLn ("Número de esboços: " ++ show (contarEsbocos caderno))
  putStrLn "--- Caderno novo ---"
  putStrLn (esbocoMaisRecente cadernoNovo)
  putStrLn ("Número de esboços: " ++ show (contarEsbocos cadernoNovo))

  -- putStrLn (titulo (head []))
