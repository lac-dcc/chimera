-----------------------------------------------------------------
--------------- Export Package  --------------------------------
-----------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;  
use IEEE.numeric_std.all;     

package pexport is

   type cpu_export_type is record
      reg_ax           : unsigned(15 downto 0);
      reg_cx           : unsigned(15 downto 0);
      reg_dx           : unsigned(15 downto 0);
      reg_bx           : unsigned(15 downto 0);
      reg_sp           : unsigned(15 downto 0);
      reg_bp           : unsigned(15 downto 0);
      reg_si           : unsigned(15 downto 0);
      reg_di           : unsigned(15 downto 0);
      reg_es           : unsigned(15 downto 0);
      reg_cs           : unsigned(15 downto 0);
      reg_ss           : unsigned(15 downto 0);
      reg_ds           : unsigned(15 downto 0);
      reg_ip           : unsigned(15 downto 0);
      reg_f            : unsigned(15 downto 0);
      opcodebyte_last  : std_logic_vector(7 downto 0);
   end record;
  
end package;

-----------------------------------------------------------------
--------------- Export module    --------------------------------
-----------------------------------------------------------------


library IEEE;
use IEEE.std_logic_1164.all;  
use IEEE.numeric_std.all;     
use STD.textio.all;

use work.pexport.all;

entity export is
   port 
   (
      clk              : in std_logic;
      ce               : in std_logic;
      reset            : in std_logic;
      
      new_export       : in std_logic;
      export_cpu       : in cpu_export_type;    
      
      export_irq       : in std_logic_vector(7 downto 0);
      
      export_8         : in std_logic_vector(7 downto 0);
      export_16        : in std_logic_vector(15 downto 0);
      export_32        : in std_logic_vector(31 downto 0)
   );
end entity;

architecture arch of export is
     
   signal totalticks   : unsigned(31 downto 0) := (others => '0');
   signal cyclenr      : unsigned(31 downto 0) := x"00000001";
     
   signal reset_1      : std_logic := '0';
   signal export_reset : std_logic := '0';
   signal exportnow    : std_logic;
   
   function to_lower(c: character) return character is
      variable l: character;
   begin
       case c is
        when 'A' => l := 'a';
        when 'B' => l := 'b';
        when 'C' => l := 'c';
        when 'D' => l := 'd';
        when 'E' => l := 'e';
        when 'F' => l := 'f';
        when 'G' => l := 'g';
        when 'H' => l := 'h';
        when 'I' => l := 'i';
        when 'J' => l := 'j';
        when 'K' => l := 'k';
        when 'L' => l := 'l';
        when 'M' => l := 'm';
        when 'N' => l := 'n';
        when 'O' => l := 'o';
        when 'P' => l := 'p';
        when 'Q' => l := 'q';
        when 'R' => l := 'r';
        when 'S' => l := 's';
        when 'T' => l := 't';
        when 'U' => l := 'u';
        when 'V' => l := 'v';
        when 'W' => l := 'w';
        when 'X' => l := 'x';
        when 'Y' => l := 'y';
        when 'Z' => l := 'z';
        when others => l := c;
    end case;
    return l;
   end to_lower;
   
   function to_lower(s: string) return string is
     variable lowercase: string (s'range);
   begin
     for i in s'range loop
        lowercase(i):= to_lower(s(i));
     end loop;
     return lowercase;
   end to_lower;
     
begin  
 
-- synthesis translate_off
   process(clk)
   begin
      if rising_edge(clk) then
         if (reset = '1') then
            totalticks <= (others => '0');
         elsif (ce = '1') then
            totalticks <= totalticks + 1;
         end if;
         reset_1 <= reset;
      end if;
   end process;
   
   export_reset <= '1' when (reset = '0' and reset_1 = '1') else '0';
   
   exportnow <= export_reset or new_export;

   process
   
      file outfile: text;
      file outfile_irp: text;
      variable f_status: FILE_OPEN_STATUS;
      variable line_out : line;
      variable recordcount : integer := 0;
      
      constant filenamebase               : string := "R:\\debug_sim";
      variable filename_current           : string(1 to 25);
      
   begin
   
      filename_current := filenamebase & "00000000.txt";
   
      file_open(f_status, outfile, filename_current, write_mode);
      file_close(outfile);
      file_open(f_status, outfile, filename_current, append_mode); 
      
      write(line_out, string'("IP   F    AX   BX   CX   DX   SP   BP   SI   DI   ES   CS   SS   DS   OP TICKS    IQ GPU D8 D16  D32"));
      writeline(outfile, line_out);
      
      while (true) loop
         wait until rising_edge(clk);
         if (reset = '1') then
            cyclenr <= x"00000001";
            filename_current := filenamebase & "00000000.txt";
            file_close(outfile);
            file_open(f_status, outfile, filename_current, write_mode);
            file_close(outfile);
            file_open(f_status, outfile, filename_current, append_mode);
            write(line_out, string'("IP   F    AX   BX   CX   DX   SP   BP   SI   DI   ES   CS   SS   DS   OP TICKS    IQ GPU D8 D16  D32"));
            writeline(outfile, line_out);
         end if;
         
         if (exportnow = '1') then
         
            write(line_out, to_lower(to_hstring(export_cpu.reg_ip)) & " ");
            write(line_out, to_lower(to_hstring(export_cpu.reg_f )) & " ");
            write(line_out, to_lower(to_hstring(export_cpu.reg_ax)) & " ");
            write(line_out, to_lower(to_hstring(export_cpu.reg_bx)) & " ");
            write(line_out, to_lower(to_hstring(export_cpu.reg_cx)) & " ");
            write(line_out, to_lower(to_hstring(export_cpu.reg_dx)) & " ");
            write(line_out, to_lower(to_hstring(export_cpu.reg_sp)) & " ");
            write(line_out, to_lower(to_hstring(export_cpu.reg_bp)) & " ");
            write(line_out, to_lower(to_hstring(export_cpu.reg_si)) & " ");
            write(line_out, to_lower(to_hstring(export_cpu.reg_di)) & " ");
            write(line_out, to_lower(to_hstring(export_cpu.reg_es)) & " ");
            write(line_out, to_lower(to_hstring(export_cpu.reg_cs)) & " ");
            write(line_out, to_lower(to_hstring(export_cpu.reg_ss)) & " ");
            write(line_out, to_lower(to_hstring(export_cpu.reg_ds)) & " ");
            
            write(line_out, to_lower(to_hstring(export_cpu.opcodebyte_last)) & " ");
            write(line_out, to_lower(to_hstring(totalticks)) & " ");
            
            write(line_out, to_lower(to_hstring(export_irq )) & " ");
            write(line_out, to_lower(to_hstring(to_unsigned(0, 12))) & " "); -- gpu
            
            write(line_out, to_lower(to_hstring(export_8 )) & " ");
            write(line_out, to_lower(to_hstring(export_16)) & " ");
            write(line_out, to_lower(to_hstring(export_32)) & " ");
      
            writeline(outfile, line_out);
            
            cyclenr     <= cyclenr + 1;
            
            if (cyclenr mod 10000000 = 0) then
               filename_current := filenamebase & to_hstring(cyclenr) & ".txt";
               file_close(outfile);
               file_open(f_status, outfile, filename_current, write_mode);
               file_close(outfile);
               file_open(f_status, outfile, filename_current, append_mode);
               write(line_out, string'("IP   F    AX   BX   CX   DX   SP   BP   SI   DI   ES   CS   SS   DS   OP TICKS    IQ GPU D8 D16  D32"));
               writeline(outfile, line_out);
            end if;
            
         end if;
            
      end loop;
      
   end process;
-- synthesis translate_on

end architecture;





