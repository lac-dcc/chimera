library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;

entity b14 is
port (
	clock,reset : in bit;
	addr : out integer range 2**20 - 1 downto 0;
	datai : in integer;
	datao : out integer;
	rd,wr : out bit
	);
end b14;

architecture BEHAV of b14 is

begin 

process(clock,reset)

variable reg0 : integer;
variable reg1 : integer;
variable reg2 : integer;
variable reg3 : integer;

variable B : bit;

variable MAR : integer range 2**20 - 1 downto 0;
variable MBR : integer;

variable mf : integer range 2**2 - 1 downto 0;
variable df : integer range 2**3 - 1 downto 0;
variable cf : integer range 1 downto 0;

variable ff : integer range 2**4 - 1 downto 0;
variable tail : integer range 2**20 - 1 downto 0;
variable IR : integer;

variable state : integer range 1 downto 0;

variable r,m,t: integer;
variable d : integer;
variable temp : integer;
variable s : integer range 3 downto 0;

constant FETCH : integer := 0;
constant EXEC : integer :=1;

begin

  if reset = '1' then
      MAR := 0;
      MBR := 0;
      IR := 0;
      d := 0;
      r := 0;
      m := 0;
      s := 0;
      temp := 0;
      mf := 0;
      df := 0;
      ff := 0;
      cf := 0;
      tail := 0;
      b := '0';
      reg0 := 0;
      reg1 := 0;
      reg2 := 0;
      reg3 := 0;
      addr <= 0;
      rd <= '0';
      wr <= '0';
      datao <= 0;
      state := FETCH;
 elsif clock'event and clock='1' then
      rd <= '0';
      wr <= '0';
      case state is
      when FETCH =>
        MAR := reg3 mod 2**20;
	addr <= MAR;
	rd <= '1';
	MBR := datai;
        IR := MBR;
	state := EXEC;
      when EXEC =>
	if IR<0 then
	  IR := -IR;
	end if;
	mf := (IR / 2**27) mod 4 ;

	df := (IR / 2**24) mod 2**3;

	ff := (IR / 2**19) mod 2**4;

	cf := (IR / 2**23) mod 2;

	tail := IR mod 2**20;
        reg3 := ((reg3 mod 2**29)+ 8);
	s := (IR/2**29) mod 4;
	case s is
	when 0 => r := reg0;
	when 1 => r := reg1;
	when 2 => r := reg2;
	when 3 => r := reg3;
	end case;
	case cf is
	when 1 =>
	  case mf is
	  when 0 => m := tail;
	  when 1 => m := datai;
		addr <= tail;
		rd <= '1';
	  when 2 => addr <= (tail + reg1) mod 2**20;
		rd <= '1';
                m := datai;
	  when 3 => addr <= (tail + reg2) mod 2**20;
		rd <= '1';
                m := datai;
	  end case;
	  case ff is
	  when 0 => if r < m then
                   B := '1';
                  else
                   B := '0';
                  end if;
	  when 1 => if not(r < m) then 
                   B := '1';
                  else
                   B := '0'; 
                  end if;
	  when 2 => if r = m then 
                   B := '1';
                  else 
                   B := '0'; 
                  end if;  
	  when 3 => if not(r = m) then 
                   B := '1'; 
                  else
                   B := '0';
                  end if; 
	  when 4 => if not(r > m) then
                   B := '1'; 
                  else 
                   B := '0'; 
                  end if;
	  when 5 => if r > m then 
                   B := '1'; 
                  else 
                   B := '0'; 
                  end if;
	  when 6 => if r > 2**30 - 1 then
                   r := r - 2**30;
                  end if;
		  if r < m then 
                   B := '1'; 
                  else 
                   B := '0'; 
                  end if;
	  when 7 => if r > 2**30 - 1 then
                   r := r - 2**30;
                  end if;
		  if not(r < m) then
                   B := '1'; 
                  else 
                   B := '0'; 
                  end if; 
	  when 8 => if (r < m) or ( B = '1') then
                    B := '1';
                   else
                    B := '0';
                   end if;
	  when 9 => if not(r < m) or ( B = '1') then
                    B := '1';
                   else
                    B := '0';
                   end if;
	  when 10 => if (r = m) or ( B = '1') then
                    B := '1';
                   else
                    B := '0';
                   end if;
	  when 11 => if not(r = m) or ( B = '1') then
                    B := '1';
                   else
                    B := '0';
                   end if;
	  when 12 => if not(r > m) or (B = '1') then
                    B := '1';
                   else
                    B := '0';
                   end if;
	  when 13 => if (r > m) or (B = '1') then
                    B := '1';
                   else
                    B := '0';
                   end if;
	  when 14 => if r > 2**30 - 1 then
                   r := r - 2**30;
                  end if;
		   if (r < m) or ( B = '1') then
                    B := '1';              
                   else
                    B := '0';
                   end if;
	  when 15 => if r > 2**30 - 1 then
                   r := r - 2**30;
                  end if;
	           if not(r < m) or ( B = '1') then
                    B := '1';
                   else
                    B := '0';
                   end if;
	  end case;
	when 0 =>
	    if not(df = 7) then
	        if df = 5 then 
	          if not(B) = '1' then
	            d := 3;
	          end if;
	        elsif df = 4 then
	          if B = '1' then
	            d := 3;
	          end if;
	        elsif df = 3 then
	          d := 3;
	        elsif df = 2 then d := 2;
	        elsif df = 1 then d := 1;
	        elsif df = 0 then d := 0;
	        end if;
	    case ff is
	    when 0 =>  
	      case mf is
	      when 0 => m := tail;
	      when 1 => m := datai;
		addr <= tail;
		rd <= '1';
	      when 2 => addr <= (tail + reg1) mod 2**20;
		rd <= '1';
                m := datai;
	      when 3 => addr <= (tail + reg2) mod 2**20;
		rd <= '1';
                m := datai;
	      end case;
	      t := 0;
	      case d is
	      when 0 => reg0 := t - m;
	      when 1 => reg1 := t - m;
	      when 2 => reg2 := t - m;
	      when 3 => reg3 := t - m;
	      when others => null;
	      end case;
	    when 1 =>  
	      case mf is
	      when 0 => m := tail;
	      when 1 => m := datai;
		addr <= tail;
		rd <= '1';
	      when 2 => addr <= (tail + reg1) mod 2**20;
		rd <= '1';
                m := datai;
	      when 3 => addr <= (tail + reg2) mod 2**20;
		rd <= '1';
                m := datai;
	      end case;
	      reg2 := reg3; 
	      reg3 := m;
	    when 2 =>  
	      case mf is
	      when 0 => m := tail;
	      when 1 => m := datai;
		addr <= tail;
		rd <= '1';
	      when 2 => addr <= (tail + reg1) mod 2**20;
		rd <= '1';
                m := datai;
	      when 3 => addr <= (tail + reg2) mod 2**20;
		rd <= '1';
                m := datai;
	      end case;
	      case d is
	      when 0 => reg0 := m;
	      when 1 => reg1 := m;
	      when 2 => reg2 := m;
	      when 3 => reg3 := m;
	      when others => null;
	      end case;
	    when 3 =>  
	      case mf is
	      when 0 => m := tail;
	      when 1 => m := datai;
		addr <= tail;
		rd <= '1';
	      when 2 => addr <= (tail + reg1) mod 2**20;
		rd <= '1';
                m := datai;
	      when 3 => addr <= (tail + reg2) mod 2**20;
		rd <= '1';
                m := datai;
	      end case;
	      case d is
	      when 0 => reg0 := m;
	      when 1 => reg1 := m;
	      when 2 => reg2 := m;
	      when 3 => reg3 := m;
	      when others => null;
	      end case;
	    when 4 =>  
	      case mf is
	      when 0 => m := tail;
	      when 1 => m := datai;
		addr <= tail;
		rd <= '1';
	      when 2 => addr <= (tail + reg1) mod 2**20;
		rd <= '1';
                m := datai;
	      when 3 => addr <= (tail + reg2) mod 2**20;
		rd <= '1';
                m := datai;
	      end case;
	      case d is
	      when 0 => reg0 := (r + m) mod 2**30;
	      when 1 => reg1 := (r + m) mod 2**30;
	      when 2 => reg2 := (r + m) mod 2**30;
	      when 3 => reg3 := (r + m) mod 2**30;
	      when others => null;
	      end case;
	    when 5 =>  
	      case mf is
	      when 0 => m := tail;
	      when 1 => m := datai;
		addr <= tail;
		rd <= '1';
	      when 2 => addr <= (tail + reg1) mod 2**20;
		rd <= '1';
                m := datai;
	      when 3 => addr <= (tail + reg2) mod 2**20;
		rd <= '1';
                m := datai;
	      end case;
	      case d is
	      when 0 => reg0 := (r + m) mod 2**30;
	      when 1 => reg1 := (r + m) mod 2**30;
	      when 2 => reg2 := (r + m) mod 2**30;
	      when 3 => reg3 := (r + m) mod 2**30;
	      when others => null;
	      end case;
	    when 6 =>   
	      case mf is
	      when 0 => m := tail;
	      when 1 => m := datai;
		addr <= tail;
		rd <= '1';
	      when 2 => addr <= (tail + reg1) mod 2**20;
		rd <= '1';
                m := datai;
	      when 3 => addr <= (tail + reg2) mod 2**20;
		rd <= '1';
                m := datai;
	      end case;
	      case d is
	      when 0 => reg0 := (r - m) mod 2**30;
	      when 1 => reg1 := (r - m) mod 2**30;
	      when 2 => reg2 := (r - m) mod 2**30;
	      when 3 => reg3 := (r - m) mod 2**30;
	      when others => null;
	      end case;
	    when 7 =>  
	      case mf is
	      when 0 => m := tail;
	      when 1 => m := datai;
		addr <= tail;
		rd <= '1';
	      when 2 => addr <= (tail + reg1) mod 2**20;
		rd <= '1';
                m := datai;
	      when 3 => addr <= (tail + reg2) mod 2**20;
		rd <= '1';
                m := datai;
	      end case;
	      case d is
	      when 0 => reg0 := (r - m) mod 2**30;
	      when 1 => reg1 := (r - m) mod 2**30;
	      when 2 => reg2 := (r - m) mod 2**30;
	      when 3 => reg3 := (r - m) mod 2**30;
	      when others => null;
	      end case;
	    when 8 =>  
	      case mf is
	      when 0 => m := tail;
	      when 1 => m := datai;
		addr <= tail;
		rd <= '1';
	      when 2 => addr <= (tail + reg1) mod 2**20;
		rd <= '1';
                m := datai;
	      when 3 => addr <= (tail + reg2) mod 2**20;
		rd <= '1';
                m := datai;
	      end case;
	      case d is
	      when 0 => reg0 := (r + m) mod 2**30;
	      when 1 => reg1 := (r + m) mod 2**30;
	      when 2 => reg2 := (r + m) mod 2**30;
	      when 3 => reg3 := (r + m) mod 2**30;
	      when others => null;
	      end case;
	    when 9 =>  
	      case mf is
	      when 0 => m := tail;
	      when 1 => m := datai;
		addr <= tail;
		rd <= '1';
	      when 2 => addr <= (tail + reg1) mod 2**20;
		rd <= '1';
                m := datai;
	      when 3 => addr <= (tail + reg2) mod 2**20;
		rd <= '1';
                m := datai;
	      end case;
	      case d is
	      when 0 => reg0 := (r - m) mod 2**30;
	      when 1 => reg1 := (r - m) mod 2**30;
	      when 2 => reg2 := (r - m) mod 2**30;
	      when 3 => reg3 := (r - m) mod 2**30;
	      when others => null;
	      end case;
	    when 10 =>  
	      case mf is
	      when 0 => m := tail;
	      when 1 => m := datai;
		addr <= tail;
		rd <= '1';
	      when 2 => addr <= (tail + reg1) mod 2**20;
		rd <= '1';
                m := datai;
	      when 3 => addr <= (tail + reg2) mod 2**20;
		rd <= '1';
                m := datai;
	      end case;
	      case d is
	      when 0 => reg0 := (r + m) mod 2**30;
	      when 1 => reg1 := (r + m) mod 2**30;
	      when 2 => reg2 := (r + m) mod 2**30;
	      when 3 => reg3 := (r + m) mod 2**30;
	      when others => null;
	      end case;
	    when 11 =>  
	      case mf is
	      when 0 => m := tail;
	      when 1 => m := datai;
		addr <= tail;
		rd <= '1';
	      when 2 => addr <= (tail + reg1) mod 2**20;
		rd <= '1';
                m := datai;
	      when 3 => addr <= (tail + reg2) mod 2**20;
		rd <= '1';
                m := datai;
	      end case;
	      case d is
	      when 0 => reg0 := (r - m) mod 2**30;
	      when 1 => reg1 := (r - m) mod 2**30;
	      when 2 => reg2 := (r - m) mod 2**30;
	      when 3 => reg3 := (r - m) mod 2**30;
	      when others => null;
	      end case;
	    when 12 =>
	      case mf is
	      when 0 => t := r / 2;
              when 1 => t := r / 2;
		if B = '1' then
		  t := t mod  2**29;
		end if;
	      when 2 => t := (r mod 2**29) * 2;
	      when 3 => t := (r mod 2**29) * 2;
		if t > 2**30 - 1 then
		  B := '1';
		else
		  B := '0';
		end if;
              when others => null;
	      end case;
	      case d is
	      when 0 => reg0 := t;
	      when 1 => reg1 := t;
	      when 2 => reg2 := t;
	      when 3 => reg3 := t;
	      when others => null;
	      end case;
	    when 13 | 14 | 15 => null;
	    end case;
	  elsif df = 7 then
	    case mf is
	    when 0 => m := tail;
	    when 1 => m := tail;
	    when 2 => m := (reg1 mod 2**20) + (tail mod 2**20);
	    when 3 => m := (reg2 mod 2**20) + (tail mod 2**20);
	    end case;
	    -- addr <= m;
	    addr <= m mod 2*20;
	    -- removed (!)fs020699
	    wr <='1';
	    datao <= r;
	  end if;
	end case;
	state := FETCH;
      end case;
  end if;

end process;

end BEHAV;

entity b14rev is
port (
	clock,reset : in bit;
	addr : out integer range 2**20 - 1 downto 0;
	datai : in integer;
	datao : out integer;
	rd,wr : out bit
	);
end b14rev;

architecture BEHAV of b14rev is

begin 

process(clock,reset)

variable reg0 : integer;
variable reg1 : integer;
variable reg2 : integer;
variable reg3 : integer;

variable B : bit;

variable MAR : integer range 2**20 - 1 downto 0;
variable MBR : integer;

variable mf : integer range 2**2 - 1 downto 0;
variable df : integer range 2**3 - 1 downto 0;
variable cf : integer range 1 downto 0;

variable ff : integer range 2**4 - 1 downto 0;
variable tail : integer range 2**20 - 1 downto 0;
variable IR : integer;

variable state : integer range 1 downto 0;

variable r,m,t: integer;
variable d : integer;
variable temp : integer;
variable s : integer range 3 downto 0;

constant FETCH : integer := 0;
constant EXEC : integer :=1;

begin

  if reset = '1' then
      MAR := 0;
      MBR := 0;
      IR := 0;
      d := 0;
      r := 0;
      m := 0;
      s := 0;
      temp := 0;
      mf := 0;
      df := 0;
      ff := 0;
      cf := 0;
      tail := 0;
      b := '0';
      reg0 := 0;
      reg1 := 0;
      reg2 := 0;
      reg3 := 0;
      addr <= 0;
      rd <= '0';
      wr <= '0';
      datao <= 0;
      state := FETCH;
 elsif clock'event and clock='1' then
      rd <= '0';
      wr <= '0';
      case state is
      when FETCH =>
        MAR := reg3 mod 2**20;
	addr <= MAR;
	rd <= '1';
	MBR := datai;
        IR := MBR;
	state := EXEC;
      when EXEC =>
	if IR<0 then
	  IR := -IR;
	end if;
	mf := (IR / 2**27) mod 4 ;

	df := (IR / 2**24) mod 2**3;

	ff := (IR / 2**19) mod 2**4;

	cf := (IR / 2**23) mod 2;

	tail := IR mod 2**20;
        reg3 := ((reg3 mod 2**29)- 8);
	s := (IR/2**29) mod 4;
	case s is
	when 0 => r := reg0;
	when 1 => r := reg1;
	when 2 => r := reg2;
	when 3 => r := reg3;
	end case;
	case cf is
	when 1 =>
	  case mf is
	  when 0 => m := tail;
	  when 1 => m := datai;
		addr <= tail;
		rd <= '1';
	  when 2 => addr <= (tail - reg1) mod 2**20;
		rd <= '1';
                m := datai;
	  when 3 => addr <= (tail - reg2) mod 2**20;
		rd <= '1';
                m := datai;
	  end case;
	  case ff is
	  when 0 => if r < m then
                   B := '1';
                  else
                   B := '0';
                  end if;
	  when 1 => if not(r < m) then 
                   B := '1';
                  else
                   B := '0'; 
                  end if;
	  when 2 => if r = m then 
                   B := '1';
                  else 
                   B := '0'; 
                  end if;  
	  when 3 => if not(r = m) then 
                   B := '1'; 
                  else
                   B := '0';
                  end if; 
	  when 4 => if not(r > m) then
                   B := '1'; 
                  else 
                   B := '0'; 
                  end if;
	  when 5 => if r > m then 
                   B := '1'; 
                  else 
                   B := '0'; 
                  end if;
	  when 6 => if r > 2**30 - 1 then
                   r := r - 2**30;
                  end if;
		  if r < m then 
                   B := '1'; 
                  else 
                   B := '0'; 
                  end if;
	  when 7 => if r > 2**30 - 1 then
                   r := r - 2**30;
                  end if;
		  if not(r < m) then
                   B := '1'; 
                  else 
                   B := '0'; 
                  end if; 
	  when 8 => if (r < m) or ( B = '1') then
                    B := '1';
                   else
                    B := '0';
                   end if;
	  when 9 => if not(r < m) or ( B = '1') then
                    B := '1';
                   else
                    B := '0';
                   end if;
	  when 10 => if (r = m) or ( B = '1') then
                    B := '1';
                   else
                    B := '0';
                   end if;
	  when 11 => if not(r = m) or ( B = '1') then
                    B := '1';
                   else
                    B := '0';
                   end if;
	  when 12 => if not(r > m) or (B = '1') then
                    B := '1';
                   else
                    B := '0';
                   end if;
	  when 13 => if (r > m) or (B = '1') then
                    B := '1';
                   else
                    B := '0';
                   end if;
	  when 14 => if r > 2**30 - 1 then
                   r := r - 2**30;
                  end if;
		   if (r < m) or ( B = '1') then
                    B := '1';              
                   else
                    B := '0';
                   end if;
	  when 15 => if r > 2**30 - 1 then
                   r := r - 2**30;
                  end if;
	           if not(r < m) or ( B = '1') then
                    B := '1';
                   else
                    B := '0';
                   end if;
	  end case;
	when 0 =>
	    if not(df = 7) then
	        if df = 5 then 
	          if not(B) = '1' then
	            d := 3;
	          end if;
	        elsif df = 4 then
	          if B = '1' then
	            d := 3;
	          end if;
	        elsif df = 3 then
	          d := 3;
	        elsif df = 2 then d := 2;
	        elsif df = 1 then d := 1;
	        elsif df = 0 then d := 0;
	        end if;
	    case ff is
	    when 0 =>  
	      case mf is
	      when 0 => m := tail;
	      when 1 => m := datai;
		addr <= tail;
		rd <= '1';
	      when 2 => addr <= (tail - reg1) mod 2**20;
		rd <= '1';
                m := datai;
	      when 3 => addr <= (tail - reg2) mod 2**20;
		rd <= '1';
                m := datai;
	      end case;
	      t := 0;
	      case d is
	      when 0 => reg0 := t + m;
	      when 1 => reg1 := t + m;
	      when 2 => reg2 := t + m;
	      when 3 => reg3 := t + m;
	      when others => null;
	      end case;
	    when 1 =>  
	      case mf is
	      when 0 => m := tail;
	      when 1 => m := datai;
		addr <= tail;
		rd <= '1';
	      when 2 => addr <= (tail - reg1) mod 2**20;
		rd <= '1';
                m := datai;
	      when 3 => addr <= (tail - reg2) mod 2**20;
		rd <= '1';
                m := datai;
	      end case;
	      reg2 := reg3; 
	      reg3 := m;
	    when 2 =>  
	      case mf is
	      when 0 => m := tail;
	      when 1 => m := datai;
		addr <= tail;
		rd <= '1';
	      when 2 => addr <= (tail - reg1) mod 2**20;
		rd <= '1';
                m := datai;
	      when 3 => addr <= (tail - reg2) mod 2**20;
		rd <= '1';
                m := datai;
	      end case;
	      case d is
	      when 0 => reg0 := m;
	      when 1 => reg1 := m;
	      when 2 => reg2 := m;
	      when 3 => reg3 := m;
	      when others => null;
	      end case;
	    when 3 =>  
	      case mf is
	      when 0 => m := tail;
	      when 1 => m := datai;
		addr <= tail;
		rd <= '1';
	      when 2 => addr <= (tail - reg1) mod 2**20;
		rd <= '1';
                m := datai;
	      when 3 => addr <= (tail - reg2) mod 2**20;
		rd <= '1';
                m := datai;
	      end case;
	      case d is
	      when 0 => reg0 := m;
	      when 1 => reg1 := m;
	      when 2 => reg2 := m;
	      when 3 => reg3 := m;
	      when others => null;
	      end case;
	    when 4 =>  
	      case mf is
	      when 0 => m := tail;
	      when 1 => m := datai;
		addr <= tail;
		rd <= '1';
	      when 2 => addr <= (tail - reg1) mod 2**20;
		rd <= '1';
                m := datai;
	      when 3 => addr <= (tail - reg2) mod 2**20;
		rd <= '1';
                m := datai;
	      end case;
	      case d is
	      when 0 => reg0 := (r - m) mod 2**30;
	      when 1 => reg1 := (r - m) mod 2**30;
	      when 2 => reg2 := (r - m) mod 2**30;
	      when 3 => reg3 := (r - m) mod 2**30;
	      when others => null;
	      end case;
	    when 5 =>  
	      case mf is
	      when 0 => m := tail;
	      when 1 => m := datai;
		addr <= tail;
		rd <= '1';
	      when 2 => addr <= (tail - reg1) mod 2**20;
		rd <= '1';
                m := datai;
	      when 3 => addr <= (tail - reg2) mod 2**20;
		rd <= '1';
                m := datai;
	      end case;
	      case d is
	      when 0 => reg0 := (r - m) mod 2**30;
	      when 1 => reg1 := (r - m) mod 2**30;
	      when 2 => reg2 := (r - m) mod 2**30;
	      when 3 => reg3 := (r - m) mod 2**30;
	      when others => null;
	      end case;
	    when 6 =>   
	      case mf is
	      when 0 => m := tail;
	      when 1 => m := datai;
		addr <= tail;
		rd <= '1';
	      when 2 => addr <= (tail - reg1) mod 2**20;
		rd <= '1';
                m := datai;
	      when 3 => addr <= (tail - reg2) mod 2**20;
		rd <= '1';
                m := datai;
	      end case;
	      case d is
	      when 0 => reg0 := (r + m) mod 2**30;
	      when 1 => reg1 := (r + m) mod 2**30;
	      when 2 => reg2 := (r + m) mod 2**30;
	      when 3 => reg3 := (r + m) mod 2**30;
	      when others => null;
	      end case;
	    when 7 =>  
	      case mf is
	      when 0 => m := tail;
	      when 1 => m := datai;
		addr <= tail;
		rd <= '1';
	      when 2 => addr <= (tail - reg1) mod 2**20;
		rd <= '1';
                m := datai;
	      when 3 => addr <= (tail - reg2) mod 2**20;
		rd <= '1';
                m := datai;
	      end case;
	      case d is
	      when 0 => reg0 := (r + m) mod 2**30;
	      when 1 => reg1 := (r + m) mod 2**30;
	      when 2 => reg2 := (r + m) mod 2**30;
	      when 3 => reg3 := (r + m) mod 2**30;
	      when others => null;
	      end case;
	    when 8 =>  
	      case mf is
	      when 0 => m := tail;
	      when 1 => m := datai;
		addr <= tail;
		rd <= '1';
	      when 2 => addr <= (tail - reg1) mod 2**20;
		rd <= '1';
                m := datai;
	      when 3 => addr <= (tail - reg2) mod 2**20;
		rd <= '1';
                m := datai;
	      end case;
	      case d is
	      when 0 => reg0 := (r - m) mod 2**30;
	      when 1 => reg1 := (r - m) mod 2**30;
	      when 2 => reg2 := (r - m) mod 2**30;
	      when 3 => reg3 := (r - m) mod 2**30;
	      when others => null;
	      end case;
	    when 9 =>  
	      case mf is
	      when 0 => m := tail;
	      when 1 => m := datai;
		addr <= tail;
		rd <= '1';
	      when 2 => addr <= (tail - reg1) mod 2**20;
		rd <= '1';
                m := datai;
	      when 3 => addr <= (tail - reg2) mod 2**20;
		rd <= '1';
                m := datai;
	      end case;
	      case d is
	      when 0 => reg0 := (r + m) mod 2**30;
	      when 1 => reg1 := (r + m) mod 2**30;
	      when 2 => reg2 := (r + m) mod 2**30;
	      when 3 => reg3 := (r + m) mod 2**30;
	      when others => null;
	      end case;
	    when 10 =>  
	      case mf is
	      when 0 => m := tail;
	      when 1 => m := datai;
		addr <= tail;
		rd <= '1';
	      when 2 => addr <= (tail - reg1) mod 2**20;
		rd <= '1';
                m := datai;
	      when 3 => addr <= (tail - reg2) mod 2**20;
		rd <= '1';
                m := datai;
	      end case;
	      case d is
	      when 0 => reg0 := (r - m) mod 2**30;
	      when 2 => reg1 := (r - m) mod 2**30;
	      when 1 => reg2 := (r - m) mod 2**30;
	      when 3 => reg3 := (r - m) mod 2**30;
	      when others => null;
	      end case;
	    when 11 =>  
	      case mf is
	      when 0 => m := tail;
	      when 1 => m := datai;
		addr <= tail;
		rd <= '1';
	      when 2 => addr <= (tail - reg1) mod 2**20;
		rd <= '1';
                m := datai;
	      when 3 => addr <= (tail - reg2) mod 2**20;
		rd <= '1';
                m := datai;
	      end case;
	      case d is
	      when 3 => reg0 := (r + m) mod 2**30;
	      when 1 => reg1 := (r + m) mod 2**30;
	      when 2 => reg2 := (r + m) mod 2**30;
	      when 0 => reg3 := (r + m) mod 2**30;
	      when others => null;
	      end case;
	    when 12 =>
	      case mf is
	      when 0 => t := r / 2;
              when 3 => t := r / 2;
		if B = '1' then
		  t := t mod  2**29;
		end if;
	      when 1 => t := (r mod 2**29) * 2;
	      when 2 => t := (r mod 2**29) * 2;
		if t > 2**30 - 1 then
		  B := '1';
		else
		  B := '0';
		end if;
              when others => null;
	      end case;
	      case d is
	      when 3 => reg0 := t;
	      when 2 => reg1 := t;
	      when 1 => reg2 := t;
	      when 0 => reg3 := t;
	      when others => null;
	      end case;
	    when 13 | 14 | 15 => null;
	    end case;
	  elsif df = 7 then
	    case mf is
	    when 3 => m := tail;
	    when 2 => m := tail;
	    when 0 => m := (reg1 mod 2**20) - (tail mod 2**20);
	    when 1 => m := (reg2 mod 2**20) - (tail mod 2**20);
	    end case;
	    -- addr <= m;
	    addr <= m mod 2**20;
	    -- removed (!)fs020699
	    wr <='1';
	    datao <= r;
	  end if;
	end case;
	state := FETCH;
      end case;
  end if;

end process;

end BEHAV;

entity b14_1 is
port (
	clock,reset : in bit;
	addr : out integer range 2**20 - 1 downto 0;
	datai : in integer;
	datao : out integer;
	rd,wr : out bit
	);
end b14_1;

architecture BEHAV of b14_1 is

begin 

process(clock,reset)

variable reg0 : integer;
variable reg1 : integer;
variable reg2 : integer;
variable reg3 : integer;

variable B : bit;

variable MAR : integer range 2**20 - 1 downto 0;
variable MBR : integer;

variable mf : integer range 2**2 - 1 downto 0;
variable df : integer range 2**3 - 1 downto 0;
variable cf : integer range 1 downto 0;

variable ff : integer range 2**4 - 1 downto 0;
variable tail : integer range 2**20 - 1 downto 0;
variable IR : integer;

variable state : integer range 1 downto 0;

variable r,m,t: integer;
variable d : integer;
variable temp : integer;
variable s : integer range 3 downto 0;

constant FETCH : integer := 0;
constant EXEC : integer :=1;

begin

  if reset = '1' then
      MAR := 0;
      MBR := 0;
      IR := 0;
      d := 0;
      r := 0;
      m := 0;
      s := 0;
      temp := 0;
      mf := 0;
      df := 0;
      ff := 0;
      cf := 0;
      tail := 0;
      b := '0';
      reg0 := 0;
      reg1 := 0;
      reg2 := 0;
      reg3 := 0;
      addr <= 0;
      rd <= '0';
      wr <= '0';
      datao <= 0;
      state := FETCH;
 elsif clock'event and clock='1' then
      rd <= '0';
      wr <= '0';
      case state is
      when FETCH =>
        MAR := reg3 mod 2**20;
	addr <= MAR;
	rd <= '1';
	MBR := datai;
        IR := MBR;
	state := EXEC;
      when EXEC =>
	if IR<0 then
	  IR := -IR;
	end if;
	mf := (IR / 2**27) mod 4 ;

	df := (IR / 2**24) mod 2**3;

	ff := (IR / 2**19) mod 2**4;

	cf := (IR / 2**23) mod 2;

	tail := IR mod 2**20;
        reg3 := ((reg3 mod 2**29)+ 8);
	s := (IR/2**29) mod 4;
	case s is
	when 0 => r := reg0;
	when 1 => r := reg1;
	when 2 => r := reg2;
	when 3 => r := reg3;
	end case;
	case cf is
	when 1 =>
	  case mf is
	  when 0 => m := tail;
	  when 1 => m := datai;
		addr <= tail;
		rd <= '1';
	  when 2 => addr <= (tail + reg1) mod 2**20;
		rd <= '1';
                m := datai;
	  when 3 => addr <= (tail + reg2) mod 2**20;
		rd <= '1';
                m := datai;
	  end case;
	  case ff is
	  when 0 => if r < m then
                   B := '1';
                  else
                   B := '0';
                  end if;
	  when 1 => if not(r < m) then 
                   B := '1';
                  else
                   B := '0'; 
                  end if;
	  when 2 => if r = m then 
                   B := '1';
                  else 
                   B := '0'; 
                  end if;  
	  when 3 => if not(r = m) then 
                   B := '1'; 
                  else
                   B := '0';
                  end if; 
	  when 4 => if not(r > m) then
                   B := '1'; 
                  else 
                   B := '0'; 
                  end if;
	  when 5 => if r > m then 
                   B := '1'; 
                  else 
                   B := '0'; 
                  end if;
	  when 6 => if r > 2**30 - 1 then
                   r := r - 2**30;
                  end if;
		  if r < m then 
                   B := '1'; 
                  else 
                   B := '0'; 
                  end if;
	  when 7 => if r > 2**30 - 1 then
                   r := r - 2**30;
                  end if;
		  if not(r < m) then
                   B := '1'; 
                  else 
                   B := '0'; 
                  end if; 
	  when 8 => if (r < m) or ( B = '1') then
                    B := '1';
                   else
                    B := '0';
                   end if;
	  when 9 => if not(r < m) or ( B = '1') then
                    B := '1';
                   else
                    B := '0';
                   end if;
	  when 10 => if (r = m) or ( B = '1') then
                    B := '1';
                   else
                    B := '0';
                   end if;
	  when 11 => if not(r = m) or ( B = '1') then
                    B := '1';
                   else
                    B := '0';
                   end if;
	  when 12 => if not(r > m) or (B = '1') then
                    B := '1';
                   else
                    B := '0';
                   end if;
	  when 13 => if (r > m) or (B = '1') then
                    B := '1';
                   else
                    B := '0';
                   end if;
	  when 14 => if r > 2**30 - 1 then
                   r := r - 2**30;
                  end if;
		   if (r < m) or ( B = '1') then
                    B := '1';              
                   else
                    B := '0';
                   end if;
	  when 15 => if r > 2**30 - 1 then
                   r := r - 2**30;
                  end if;
	           if not(r < m) or ( B = '1') then
                    B := '1';
                   else
                    B := '0';
                   end if;
	  end case;
	when 0 =>
	    if not(df = 7) then
	        if df = 5 then 
	          if not(B) = '1' then
	            d := 3;
	          end if;
	        elsif df = 4 then
	          if B = '1' then
	            d := 3;
	          end if;
	        elsif df = 3 then
	          d := 3;
	        elsif df = 2 then d := 2;
	        elsif df = 1 then d := 1;
	        elsif df = 0 then d := 0;
	        end if;
	    case ff is
	    when 0 =>  
	      case mf is
	      when 0 => m := tail;
	      when 1 => m := datai;
		addr <= tail;
		rd <= '1';
	      when 2 => addr <= (tail + reg1) mod 2**20;
		rd <= '1';
                m := datai;
	      when 3 => addr <= (tail + reg2) mod 2**20;
		rd <= '1';
                m := datai;
	      end case;
	      t := 0;
	      case d is
	      when 0 => reg0 := t - m;
	      when 1 => reg1 := t - m;
	      when 2 => reg2 := t - m;
	      when 3 => reg3 := t - m;
	      when others => null;
	      end case;
	    when 1 =>  
	      case mf is
	      when 0 => m := tail;
	      when 1 => m := datai;
		addr <= tail;
		rd <= '1';
	      when 2 => addr <= (tail + reg1) mod 2**20;
		rd <= '1';
                m := datai;
	      when 3 => addr <= (tail + reg2) mod 2**20;
		rd <= '1';
                m := datai;
	      end case;
	      reg2 := reg3; 
	      reg3 := m;
	    when 2 =>  
	      case mf is
	      when 0 => m := tail;
	      when 1 => m := datai;
		addr <= tail;
		rd <= '1';
	      when 2 => addr <= (tail + reg1) mod 2**20;
		rd <= '1';
                m := datai;
	      when 3 => addr <= (tail + reg2) mod 2**20;
		rd <= '1';
                m := datai;
	      end case;
	      case d is
	      when 0 => reg0 := m;
	      when 1 => reg1 := m;
	      when 2 => reg2 := m;
	      when 3 => reg3 := m;
	      when others => null;
	      end case;
	    when 3 =>  
	      case mf is
	      when 0 => m := tail;
	      when 1 => m := datai;
		addr <= tail;
		rd <= '1';
	      when 2 => addr <= (tail + reg1) mod 2**20;
		rd <= '1';
                m := datai;
	      when 3 => addr <= (tail + reg2) mod 2**20;
		rd <= '1';
                m := datai;
	      end case;
	      case d is
	      when 0 => reg0 := m;
	      when 1 => reg1 := m;
	      when 2 => reg2 := m;
	      when 3 => reg3 := m;
	      when others => null;
	      end case;
	    when 4 =>  
	      case mf is
	      when 0 => m := tail;
	      when 1 => m := datai;
		addr <= tail;
		rd <= '1';
	      when 2 => addr <= (tail + reg1) mod 2**20;
		rd <= '1';
                m := datai;
	      when 3 => addr <= (tail + reg2) mod 2**20;
		rd <= '1';
                m := datai;
	      end case;
	      case d is
	      when 0 => reg0 := (r + m) mod 2**30;
	      when 1 => reg1 := (r + m) mod 2**30;
	      when 2 => reg2 := (r + m) mod 2**30;
	      when 3 => reg3 := (r + m) mod 2**30;
	      when others => null;
	      end case;
	    when 5 =>  
	      case mf is
	      when 0 => m := tail;
	      when 1 => m := datai;
		addr <= tail;
		rd <= '1';
	      when 2 => addr <= (tail + reg1) mod 2**20;
		rd <= '1';
                m := datai;
	      when 3 => addr <= (tail + reg2) mod 2**20;
		rd <= '1';
                m := datai;
	      end case;
	      case d is
	      when 0 => reg0 := (r + m) mod 2**30;
	      when 1 => reg1 := (r + m) mod 2**30;
	      when 2 => reg2 := (r + m) mod 2**30;
	      when 3 => reg3 := (r + m) mod 2**30;
	      when others => null;
	      end case;
	    when 6 =>   
	      case mf is
	      when 0 => m := tail;
	      when 1 => m := datai;
		addr <= tail;
		rd <= '1';
	      when 2 => addr <= (tail + reg1) mod 2**20;
		rd <= '1';
                m := datai;
	      when 3 => addr <= (tail + reg2) mod 2**20;
		rd <= '1';
                m := datai;
	      end case;
	      case d is
	      when 0 => reg0 := (r - m) mod 2**30;
	      when 1 => reg1 := (r - m) mod 2**30;
	      when 2 => reg2 := (r - m) mod 2**30;
	      when 3 => reg3 := (r - m) mod 2**30;
	      when others => null;
	      end case;
	    when 7 =>  
	      case mf is
	      when 0 => m := tail;
	      when 1 => m := datai;
		addr <= tail;
		rd <= '1';
	      when 2 => addr <= (tail + reg1) mod 2**20;
		rd <= '1';
                m := datai;
	      when 3 => addr <= (tail + reg2) mod 2**20;
		rd <= '1';
                m := datai;
	      end case;
	      case d is
	      when 0 => reg0 := (r - m) mod 2**30;
	      when 1 => reg1 := (r - m) mod 2**30;
	      when 2 => reg2 := (r - m) mod 2**30;
	      when 3 => reg3 := (r - m) mod 2**30;
	      when others => null;
	      end case;
	    when 8 =>  
	      case mf is
	      when 0 => m := tail;
	      when 1 => m := datai;
		addr <= tail;
		rd <= '1';
	      when 2 => addr <= (tail + reg1) mod 2**20;
		rd <= '1';
                m := datai;
	      when 3 => addr <= (tail + reg2) mod 2**20;
		rd <= '1';
                m := datai;
	      end case;
	      case d is
	      when 0 => reg0 := (r + m) mod 2**30;
	      when 1 => reg1 := (r + m) mod 2**30;
	      when 2 => reg2 := (r + m) mod 2**30;
	      when 3 => reg3 := (r + m) mod 2**30;
	      when others => null;
	      end case;
	    when 9 =>  
	      case mf is
	      when 0 => m := tail;
	      when 1 => m := datai;
		addr <= tail;
		rd <= '1';
	      when 2 => addr <= (tail + reg1) mod 2**20;
		rd <= '1';
                m := datai;
	      when 3 => addr <= (tail + reg2) mod 2**20;
		rd <= '1';
                m := datai;
	      end case;
	      case d is
	      when 0 => reg0 := (r - m) mod 2**30;
	      when 1 => reg1 := (r - m) mod 2**30;
	      when 2 => reg2 := (r - m) mod 2**30;
	      when 3 => reg3 := (r - m) mod 2**30;
	      when others => null;
	      end case;
	    when 10 =>  
	      case mf is
	      when 0 => m := tail;
	      when 1 => m := datai;
		addr <= tail;
		rd <= '1';
	      when 2 => addr <= (tail + reg1) mod 2**20;
		rd <= '1';
                m := datai;
	      when 3 => addr <= (tail + reg2) mod 2**20;
		rd <= '1';
                m := datai;
	      end case;
	      case d is
	      when 0 => reg0 := (r + m) mod 2**30;
	      when 1 => reg1 := (r + m) mod 2**30;
	      when 2 => reg2 := (r + m) mod 2**30;
	      when 3 => reg3 := (r + m) mod 2**30;
	      when others => null;
	      end case;
	    when 11 =>  
	      case mf is
	      when 0 => m := tail;
	      when 1 => m := datai;
		addr <= tail;
		rd <= '1';
	      when 2 => addr <= (tail + reg1) mod 2**20;
		rd <= '1';
                m := datai;
	      when 3 => addr <= (tail + reg2) mod 2**20;
		rd <= '1';
                m := datai;
	      end case;
	      case d is
	      when 0 => reg0 := (r - m) mod 2**30;
	      when 1 => reg1 := (r - m) mod 2**30;
	      when 2 => reg2 := (r - m) mod 2**30;
	      when 3 => reg3 := (r - m) mod 2**30;
	      when others => null;
	      end case;
	    when 12 =>
	      case mf is
	      when 0 => t := r / 2;
              when 1 => t := r / 2;
		if B = '1' then
		  t := t mod  2**29;
		end if;
	      when 2 => t := (r mod 2**29) * 2;
	      when 3 => t := (r mod 2**29) * 2;
		if t > 2**30 - 1 then
		  B := '1';
		else
		  B := '0';
		end if;
              when others => null;
	      end case;
	      case d is
	      when 0 => reg0 := t;
	      when 1 => reg1 := t;
	      when 2 => reg2 := t;
	      when 3 => reg3 := t;
	      when others => null;
	      end case;
	    when 13 | 14 | 15 => null;
	    end case;
	  elsif df = 7 then
	    case mf is
	    when 0 => m := tail;
	    when 1 => m := tail;
	    when 2 => m := (reg1 mod 2**20) + (tail mod 2**20);
	    when 3 => m := (reg2 mod 2**20) + (tail mod 2**20);
	    end case;
	    -- addr <= m;
	    addr <= m mod 2**20;
	    -- removed (!)fs020699
	    wr <='1';
	    datao <= r;
	  end if;
	end case;
	state := FETCH;
      end case;
  end if;

end process;

end BEHAV;


entity b22 is
    port(clock,reset : in bit;
	si : in integer;
	so : out integer range 2**20 - 1 downto 0;
	rd,wr : out bit
	);
end b22;

architecture BEHAV of b22 is

component b14
port (
	clock,reset : in bit;
	addr : out integer range 2**20 - 1 downto 0;
	datai : in integer;
	datao : out integer;
	rd,wr : out bit
	);
end component;

component b14_1
port (
	clock,reset : in bit;
	addr : out integer range 2**20 - 1 downto 0;
	datai : in integer;
	datao : out integer;
	rd,wr : out bit
	);
end component;

component b14rev
port (
	clock,reset : in bit;
	addr : out integer range 2**20 - 1 downto 0;
	datai : in integer;
	datao : out integer;
	rd,wr : out bit
	);
end component;

for all : b14 use entity work.b14(BEHAV);
for all : b14_1 use entity work.b14_1(BEHAV);
for all : b14rev use entity work.b14rev(BEHAV);

signal addr_1,addr_2,addr_3 : integer range 2**20 - 1 downto 0;
signal datai_1,datai_2,datai_3 : integer;
signal datao_1,datao_2,datao_3 : integer;
signal rd_1,rd_2,rd_3,wr_1,wr_2,wr_3 : bit;

begin

P1 : b14 port map (clock,reset,addr_1,datai_1,datao_1,rd_1,wr_1);
P2 : b14_1 port map  (clock,reset,addr_2,datai_2,datao_2,rd_2,wr_2);
P3 : b14rev port map (clock,reset,addr_3,datai_3,datao_3,rd_3,wr_3);

process(addr_1,addr_2,addr_3,rd_1,rd_2,rd_3,wr_1,wr_2,wr_3,
datao_1,datao_2,datao_3,si)

begin
    --so <= addr_1 + addr_2 - addr_3;
    so <= (addr_1 + addr_2 - addr_3) mod 2**20;
    -- removed (!)fs020699
    rd <= (rd_1 xor not rd_2) or rd_3;
    wr <= (wr_1 xor not wr_2) or wr_3;

    if (addr_1 < 2**19 and addr_2 < 2**19 and addr_3 > 2**19-1 and rd_1 = '0') or
	(addr_1 > 2**19-1 and addr_2 > 2**19-1 and addr_3 < 2**19 and rd_2 = '0') then
	datai_1 <= datao_2 + si;
	datai_2 <= datao_1;
	datai_3 <= datao_1 - datao_2;
    else
	datai_1 <= datao_2;
	datai_2 <= datao_1 + si;
	datai_3 <= si;
    end if;
end process;

end BEHAV;
