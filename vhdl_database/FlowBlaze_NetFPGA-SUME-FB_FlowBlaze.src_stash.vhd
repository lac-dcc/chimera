library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.all;

library work;
use work.hash_pkg.all;

entity stash is
  Port (

         clk          : in std_logic;
         reset        : in std_logic;

         insert       : in std_logic; -- 1 for inserting key
         search       : in std_logic; -- 1 for searching a key
         remove       : in std_logic; -- 1 for removing a key
         update       : in std_logic; -- 1 for updating a key
         key          : in std_logic_vector( KEY_LEN -1 downto 0); -- key to insert/update in stash
         search_key   : in std_logic_vector (KEY_LEN-1 downto 0); -- key to search
         value        : in std_logic_vector( VALUE_LEN -1 downto 0); -- value to insert or update

         not_empty    :  out std_logic;
         key_out      :  out std_logic_vector(KEY_LEN -1  downto 0) ;  -- key at the top of the stash 
         value_out    :  out std_logic_vector(VALUE_LEN -1  downto 0); -- value at the top of the stash 

         tot_num_entry : out std_logic_vector(31 downto 0);
         num_entry     : out std_logic_vector(31 downto 0);
         num_present   : out std_logic_vector(31 downto 0);
         evicted_entry : out std_logic_vector(31 downto 0);
         hit           : out std_logic; -- 1 if query value is in stash
         search_value  : out std_logic_vector(VALUE_LEN -1  downto 0) -- value of the key quered

       );
end stash;

architecture Behavioral of stash is

  type stash_type is array  (STASH_DEPTH -1 downto 0) of std_logic_vector(KEY_LEN+VALUE_LEN downto 0); -- 8 posti nella stash

  signal stash : stash_type;
  signal int_evicted_entry,int_tot_num_entry : std_logic_vector(31 downto 0) := (others => '0');
  signal free_counter: std_logic_vector(31 downto 0);

begin

   tot_num_entry<=int_tot_num_entry;
   evicted_entry <= int_evicted_entry;

  process(clk)

    variable not_inserted : boolean;
    variable entry_counter : std_logic_vector(31 downto 0) := (others => '0');

  begin

    if rising_edge(clk) then 

      hit <= '0';
      search_value <= (others => '0');
      not_inserted := true;

      if (reset = '1') then

        stash <= (others => (others => '0'));
        int_tot_num_entry <= (others => '0');
        int_evicted_entry <= (others => '0');
        entry_counter := (others => '0');
     
      else 

        if (insert = '1') then 
          for I in 0 to (STASH_DEPTH-1) loop
            if not_inserted and ((stash(I)(KEY_LEN+VALUE_LEN)) = '0') then
              stash(I)(KEY_LEN+VALUE_LEN) <= '1'; -- occupied seat
              stash(I)(KEY_LEN+VALUE_LEN-1 downto KEY_LEN) <= value;
              stash(I)(KEY_LEN-1 downto 0) <= key;
              entry_counter := entry_counter + 1;
              int_tot_num_entry <= int_tot_num_entry + 1;
              not_inserted := false;
            end if;
          end loop;
            if (not_inserted) then 
                int_evicted_entry <= int_evicted_entry+1;
            end if;
        end if;
        
        
        for I in 0 to (STASH_DEPTH -1) loop
            if ((stash(I)(KEY_LEN-1 downto 0)) = search_key) and ((stash(I)(KEY_LEN+VALUE_LEN)) = '1') then
              if (remove = '1') then 
                 (stash(I)(KEY_LEN+VALUE_LEN)) <= '0';
                    entry_counter := entry_counter -1;
              end if;
              if (update = '1') then 
                stash(I)(VALUE_LEN + KEY_LEN - 1 downto KEY_LEN) <= value;
              end if;
              if (search='1') then
                hit <= '1';
                search_value <= stash(I)(VALUE_LEN + KEY_LEN - 1 downto KEY_LEN);
              end if;              
            end if;
        end loop; 
        
      end if;
      
      num_entry<= entry_counter;

    end if;

  end process;

  process (stash,free_counter)
  begin


      not_empty <= '0';
      value_out <= (others => '0');
      key_out <= (others => '0');

     for I in 0 to (STASH_DEPTH -1) loop
          
         if ((stash(I)(KEY_LEN+VALUE_LEN)) = '1') then
          
            value_out <= stash(I)(key_len+value_len-1 downto key_len);
            key_out <= stash(I)(key_len-1 downto 0);
            if (free_counter(3 downto 0)="0000") then 
                not_empty <= '1';
            end if; 
         end if;
      end loop; 


  end process;



process(clk)
  begin
    if(clk'event and clk = '1') then
		if (RESET = '1') then
		    free_counter <= x"00000000";
		else
		    free_counter <=  free_counter+1;
		end if;
    end if;
end process;



 process (clk)
  variable var_present :std_logic_vector(31 downto 0);
  begin
        if rising_edge(clk) then 
            var_present:= x"00000000";
            if (reset = '1') then
                num_present <= (others => '0');
            else
            for I in 0 to (STASH_DEPTH -1) loop
                 if ((stash(I)(KEY_LEN+VALUE_LEN)) = '1') then
                    var_present:= var_present+1;
                 end if;
            end loop;
            num_present<=var_present;
            end if;
         end if;   

  end process;

end Behavioral;
