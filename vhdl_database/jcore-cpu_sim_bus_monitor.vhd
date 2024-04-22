library ieee;
use ieee.std_logic_1164.all;
use std.textio.all;

use work.monitor_pkg.all;
use work.cpu2j0_pack.all;

entity bus_monitor is
  generic ( memblock : string := "IF");
  port (
       --   fault : in std_logic;
          clk : in std_logic;
          rst : in std_logic;
          cpu_bus_o : in cpu_data_o_t;
          cpu_bus_i : in cpu_data_i_t
          );

end bus_monitor;

architecture structure of bus_monitor is
 signal timeout : timeout_t;
 signal fault : std_logic;
 --signal dinxu : std_logic := '0';
 
begin

    timeout_cnt_i: timeout_cnt port map(clk => clk, rst => rst,
                                      enable => cpu_bus_o.en,
                                      ack => cpu_bus_i.ack,
                                      fault => fault,
                                      timeout => timeout);
    monitor1 : process
        begin
          wait on cpu_bus_o.en, fault;

         -- enable can only go low after ack for current bus cycle is high
          if not fault'event and (cpu_bus_o.en = '0') then 
            if (cpu_bus_i.ack = '0') then 
              report "Enable did not see ACK for " & memblock severity warning;
            end if;
          end if;

          if not cpu_bus_o.en'event and (fault = '1') then
            report "ACK timeout - do not reach in time for " & memblock severity warning;
          end if;

        end process;

        monitor11: process (cpu_bus_o.a, cpu_bus_o.en)
          begin
            if cpu_bus_o.a'event and (cpu_bus_i.ack = '0') and (cpu_bus_o.en = '1') and not cpu_bus_o.en'event then
              report "Address changed but did not see ACK for " & memblock severity warning;
            end if;
          end process;

        monitor2 : process (cpu_bus_i.ack)
          begin

            if cpu_bus_i.ack'event and (cpu_bus_i.ack = '1') and (cpu_bus_o.en = '0') then
              report "ACK raises while Enable low for " & memblock severity warning;
            end if;
          end process;
              
        monitor3 : process
          begin
            wait on cpu_bus_o.en, cpu_bus_i.ack;

            if not cpu_bus_o.en'event and (cpu_bus_i.ack = '0') and (cpu_bus_o.en = '0')  then
              if (cpu_bus_o.en'last_event >= 10 ns) then
                report "ACK falling delay is greater than 1 CC for " & memblock severity warning;
              end if;
            end if;
              
          end process;

          monitor4 : process (cpu_bus_o.rd)
          begin
            if cpu_bus_o.rd'event and (cpu_bus_o.rd = '0') and (cpu_bus_i.ack = '0') then
              report "Rd did not see ACK for " & memblock severity warning;
            end if;
          end process;

          monitor5 : process (cpu_bus_o.wr)
          begin
            if cpu_bus_o.wr'event and (cpu_bus_o.wr = '0') and (cpu_bus_i.ack = '0') then
              report "Wr did not see ACK for " & memblock severity warning;
            end if;
          end process;

          monitoren : process(cpu_bus_o)
            begin
              if cpu_bus_o.en'event and (cpu_bus_o.en = '1') then

                if (cpu_bus_o.wr = '1') then
                
                  for i in 0 to 31 loop
                    if (cpu_bus_o.a(i) /= '0') and (cpu_bus_o.a(i) /= '1') then
                      report "Writing without address " & memblock severity warning;
                      exit;
                    end if;
                  end loop;
                
                  for i in 0 to 31 loop
                    if (cpu_bus_o.d(i) /= '0') and (cpu_bus_o.d(i) /= '1') then
                      report "Writing without data " & memblock severity warning;
                      exit;
                    end if;
                  end loop;

                  for i in 0 to 3 loop
                    if (cpu_bus_o.we(i) /= '0') and (cpu_bus_o.we(i) /= '1') then
                      report "Writing without Byte lane enable " & memblock severity warning;
                      exit;
                    end if;
                  end loop;
            
                elsif (cpu_bus_o.rd = '1') then -- Wr is 0 and Rd is 1

                  for i in 0 to 31 loop
                    if (cpu_bus_o.a(i) /= '0') and (cpu_bus_o.a(i) /= '1') then
                      report "Reading without address " & memblock severity warning;
                      exit;
                    end if;
                  end loop;

                else
                  
                  report "Enable with no Rd and no Wr " & memblock severity warning;

                end if;
              end if;
 
            end process;


        monitorx : process
          begin
            wait on cpu_bus_o, cpu_bus_i;
          
          -- check if X on bus lines
          for i in 0 to 31 loop
            if (cpu_bus_o.a(i) = 'X') then
              report "address has an X for " & memblock severity warning;
              exit;
            end if;
          end loop;

          if (cpu_bus_o.en = 'X') then
            report "enable is has X for " & memblock severity warning;
          end if;

          if (cpu_bus_o.rd = 'X') then
            report "Read is has X for " & memblock severity warning;
          end if;

          if (cpu_bus_o.wr = 'X') then
            report "Write has X for " & memblock severity warning;
          end if;

          for i in 0 to 3 loop
            if (cpu_bus_o.we(i) = 'X') then
              report "Byte lane Write Enable has an X for " & memblock severity warning;
              exit;
            end if;
          end loop;

          for i in 0 to 31 loop
            if (cpu_bus_o.d(i) = 'X') then
              report "Write data has an X for " & memblock severity warning;
              exit;
            end if;
          end loop;
          
          for i in 0 to 31 loop
            if (cpu_bus_i.d(i) = 'X') then
              report "Data readback has an X for " & memblock severity warning;
              exit;
            end if;
          end loop;

          if (cpu_bus_i.ack = 'X') then
            report "ACK is has X for " & memblock severity warning;
          end if;

          -- Commented out this test because the way the buses are split into
          -- slave buses copies the same WE signal across all slave buses, even
          -- ones that are not enabled.
          -- check WE is 0 when EN is 0
          --if cpu_bus_o.en'event and (cpu_bus_o.en = '0') and (cpu_bus_o.we /= "0000") then
          --   report "Write Enable non-zero when En=0 for " & memblock severity warning;
          --end if;

          -- check WE is valid when EN and WR are 1
          if cpu_bus_o.en'event and (cpu_bus_o.en = '1' and cpu_bus_o.wr = '1') and (cpu_bus_o.we /= "1111")
          and (cpu_bus_o.we /= "1100") and (cpu_bus_o.we /= "0011")
          and (cpu_bus_o.we /= "1000") and (cpu_bus_o.we /= "0100")
          and (cpu_bus_o.we /= "0010") and (cpu_bus_o.we /= "0001") then
             report "Write Enable invalid when En=wr=1 for " & memblock severity warning;
          end if;

          -- check when we have WR that WE will be nonzero
          if (cpu_bus_o.wr = '1') and (cpu_bus_o.we = "0000") then
            report "We have Write without enabling any byte lane for " & memblock severity warning;
          end if;

          -- check when we have read that WE will be zero
          if (cpu_bus_o.rd = '1') and (cpu_bus_o.we /= "0000") then
            report "We have Read with non-zero WE for " & memblock severity warning;
          end if;

        end process;
          
   
end structure;
