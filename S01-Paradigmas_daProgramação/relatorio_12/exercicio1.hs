data Cafe = Cafe String Double Int

descrever :: Cafe -> String
descrever (Cafe nome preco _) = nome ++ " - R$ " ++ show preco

forca :: Cafe -> String
forca (Cafe _ _ intensidade)
  | intensidade >= 8 = "Forte"
  | intensidade >= 5 = "Equilibrado"
  | otherwise        = "Suave"

precoDoPedido :: Bool -> Cafe -> Double
precoDoPedido comLeite (Cafe _ preco _) =
  if comLeite
    then preco + 2.0
    else preco

main :: IO ()
main = do
  let blendDaCasa = Cafe "Blend da Casa" 12.0 9
  let cafeColombiano = Cafe "Café Colombiano" 10.0 6
  let cafeKona = Cafe "Café Kona" 15.0 3

  putStrLn (descrever blendDaCasa ++ " - " ++ forca blendDaCasa)
  putStrLn (descrever cafeColombiano ++ " - " ++ forca cafeColombiano)
  putStrLn (descrever cafeKona ++ " - " ++ forca cafeKona)

  print (precoDoPedido True blendDaCasa)
  print (precoDoPedido False blendDaCasa)
