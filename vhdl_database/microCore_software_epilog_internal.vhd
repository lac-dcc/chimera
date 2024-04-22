OTHERS => (OTHERS => 'U')
); ATTRIBUTE syn_ramstyle OF program : SIGNAL IS "block_ram";

BEGIN

internal_ram: PROCESS(clk)
BEGIN
  IF  rising_edge(clk)   THEN
     IF  en='1'  THEN
        IF  we='1'  THEN
           program(to_integer(addr)) <= di;
           do <= di;
        ELSE
           do <= program(to_integer(addr));
        END IF;
     END IF;
  END IF;
END PROCESS internal_ram;

END inference_model;
