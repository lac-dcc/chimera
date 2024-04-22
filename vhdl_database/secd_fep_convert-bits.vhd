-- convert 'bit' to 'std_logic'
    function to_std_logic(b: bit) return std_logic is
    begin
      if b = '1' then
        return '1';
      else
        return '0';
      end if;
    end;

-- convert 'bit_vector' to 'std_logic_vector'
    function to_std_logic_vector(bv:bit_vector) return std_logic_vector is
      variable sv: std_logic_vector(bv'RANGE);
    begin
      for i in bv'RANGE loop
        sv(i) := to_std_logic(bv(i));
      end loop;
      return sv;
    end;

