program DistanciaLuaTerra;

const
  G = 6.6743E-11; // Constante gravitacional
  Mterra = 5.9722E24; // Massa da Terra
  Mlua = 7.342E22; // Massa da Lua
  RAterra = 6378.137E3; // Raio m�dio da Terra
  RAlua = 1737.4E3; // Raio m�dio da Lua
  dt = 86400; // Segundos em um dia
  ANOS = 100000; // Per�odo de simula��o em anos

var
  t, delta_t, r, r_ant: real; // Tempo, passo de tempo, dist�ncia, dist�ncia anterior
  i: integer;

begin
  r_ant := 384400E3; // Dist�ncia m�dia inicial
  delta_t := 1.0; // Passo de tempo inicial (dias)
  
  for i := 1 to ANOS*365 do
  begin
    t := i * dt / 3600 / 24 / 365; // Tempo em anos
    r := r_ant - 2 * G * Mterra * Mlua / r_ant / (Mterra + Mlua) * sqr(delta_t); // Dist�ncia pela relatividade geral
    r_ant := r;
    delta_t := sqrt(r_ant * sqr(delta_t) / r); // Novo passo de tempo pela relatividade geral
    
    writeln('Ano: ', t:6:2, ' Distancia media da Lua em rela��o a Terra: ', r/1000:10:2, ' km');
  end;
end.