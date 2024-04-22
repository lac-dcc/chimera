      WHEN OTHERS   => RETURN "--------";
   END CASE;
END program;

BEGIN

data <= program(to_integer(addr));

END sim_model;