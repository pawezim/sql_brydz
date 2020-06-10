CREATE OR REPLACE PROCEDURE przelicz_punkty
(turniej_id INTEGER, system_punktacji VARCHAR)
AS

BEGIN

IF system_punktacji='sum' THEN
  UPDATE rozgrywki SET punkty_truniejowe_dla_ns=punkty_dla_ns
    FROM rozgrywki JOIN rozdania USING rozdanie_id
    WHERE rozdania.turniej_id=turniej_id;
  
  UPDATE pary SET pary.suma_punktow_turniejowych=sum(rozgrywki.punkty_turniejowe_dla_ns)
    FROM rozgrywki JOIN rozdania USING rozdanie_id
    WHERE rozdania.turniej_id=turniej_id
    AND rozgrywki.para_ns_id=pary.para_id;

  UPDATE pary SET pary.suma_punktow_turniejowych=(-1)*sum(rozgrywki.punkty_turniejowe_dla_ns)
    FROM rozgrywki JOIN rozdania USING rozdanie_id
    WHERE rozdania.turniej_id=turniej_id
    AND rozgrywki.para_we_id=pary.para_id;

END IF;

END;
