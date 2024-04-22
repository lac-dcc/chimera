--------------------------------------------------------------------------------------------------------
--  Accumulator --                                                                                    --
--  Author(s): Abdallah Cheikh abdallah.cheikh@uniroma1.it (abdallah93.as@gmail.com)                  --
--                                                                                                    --
--  Date Modified: 17-11-2019                                                                         --
--------------------------------------------------------------------------------------------------------
--  The accumuator performs a a reduction using addition on three instructions. KVRED, KDOTP, and     --
--  KDOTPPS. Eacj SIMD configuration has it's own accumulator, repllicating the dsp will also         --
--  replicate the accumulator as well.                                                                --
--------------------------------------------------------------------------------------------------------


-- ieee packages ------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_misc.all;
use ieee.numeric_std.all;
use std.textio.all;

-- local packages ------------
use work.riscv_klessydra.all;
--use work.klessydra_parameters.all;

entity ACCUMULATOR is
    generic(
      multithreaded_accl_en : natural;
      SIMD                  : natural;
      --------------------------------
      ACCL_NUM              : natural;
      FU_NUM                : natural;
      Data_Width            : natural;
      SIMD_Width            : natural
    );
	port(
      clk_i                             : in  std_logic;
      rst_ni                            : in  std_logic;
      MVTYPE_DSP                        : in  array_2d(ACCL_NUM-1 downto 0)(1 downto 0);
      accum_stage_1_en                  : in  std_logic_vector(ACCL_NUM-1 downto 0);
      accum_stage_2_en                  : in  std_logic_vector(ACCL_NUM-1 downto 0);
      recover_state_wires               : in  std_logic_vector(ACCL_NUM-1 downto 0);
      halt_dsp_lat                      : in  std_logic_vector(ACCL_NUM-1 downto 0);
      state_DSP                         : in  array_2d(ACCL_NUM-1 downto 0)(1 downto 0);
      decoded_instruction_DSP_lat       : in  array_2d(ACCL_NUM-1 downto 0)(DSP_UNIT_INSTR_SET_SIZE -1 downto 0);
      dsp_in_accum_operands             : in  array_2d(FU_NUM-1 downto 0)(SIMD_Width-1 downto 0);
      dsp_out_accum_results             : out array_2d(FU_NUM-1 downto 0)(31 downto 0)
	);
end entity;
architecture ACCUM_STG of ACCUMULATOR is
  
  subtype accl_range is integer range ACCL_NUM-1 downto 0;
  subtype fu_range   is integer range FU_NUM-1 downto 0;

  signal accum_partial_results_stg_1 : array_2d(fu_range)(127 downto 0);
begin

  -- The accumulator for the DSP unit written below for all SIMD widths

  ACCUM_replicated : for f in fu_range generate

  ACCUM_SIMD_1 : if SIMD=1 generate
    fsm_ACCUM_STAGE : process(clk_i, rst_ni)
      variable h : integer;
    begin
      if rst_ni = '0' then
      elsif rising_edge(clk_i) then
        dsp_out_accum_results(f) <= (others => '0');
        for g in 0 to (ACCL_NUM - FU_NUM) loop
          if multithreaded_accl_en = 1 then
            h := g;  -- set the spm rd/wr ports equal to the "for-loop"
          elsif multithreaded_accl_en = 0 then
            h := f;  -- set the spm rd/wr ports equal to the "for-generate" 
          end if;
          case state_DSP(h) is	
            when dsp_exec =>
              if (decoded_instruction_DSP_lat(h)(KDOTP_bit_position)   = '1'  or -- acccumulate 32-bit types
                  decoded_instruction_DSP_lat(h)(KDOTPPS_bit_position) = '1'  or
                  decoded_instruction_DSP_lat(h)(KVRED_bit_position)   = '1') and
                  MVTYPE_DSP(h) = "10" then
                if (accum_stage_1_en(h) = '1' or recover_state_wires(h) = '1') and halt_dsp_lat(h) = '0' then
                  accum_partial_results_stg_1(f)(31 downto 0)  <= dsp_in_accum_operands(f)(31 downto 0);
                end if;
                if (accum_stage_2_en(h) = '1' or recover_state_wires(h) = '1') and halt_dsp_lat(h) = '0' then
                  dsp_out_accum_results(f) <= std_logic_vector(unsigned(accum_partial_results_stg_1(f)(31 downto 0)) +
                                                            unsigned(dsp_out_accum_results(f)));
                end if;
              elsif (decoded_instruction_DSP_lat(h)(KDOTP_bit_position)   = '1'  or  -- acccumulate 8-bit and 16-bit types
                     decoded_instruction_DSP_lat(h)(KDOTPPS_bit_position) = '1'  or 
                     decoded_instruction_DSP_lat(h)(KVRED_bit_position)   = '1') and
                    (MVTYPE_DSP(h) = "01" or MVTYPE_DSP(h) = "00") then
                if (accum_stage_1_en(h) = '1' or recover_state_wires(h) = '1') and halt_dsp_lat(h) = '0' then
                  accum_partial_results_stg_1(f)(15 downto 0)  <= std_logic_vector(unsigned(dsp_in_accum_operands(f)(15 downto 0))   + unsigned(dsp_in_accum_operands(f)(31  downto 16)));
                end if;
                if (accum_stage_2_en(h) = '1' or recover_state_wires(h) = '1') and halt_dsp_lat(h) = '0' then
                  dsp_out_accum_results(f) <= std_logic_vector(unsigned(accum_partial_results_stg_1(f)(15 downto 0))  + 
                                                            unsigned(dsp_out_accum_results(f)));                
                end if;
              end if;
            when others =>
              null;
          end case;
        end loop;
      end if;
    end process;
  end generate ACCUM_SIMD_1;

  ACCUM_SIMD_2 : if SIMD=2 generate
    fsm_ACCUM_STAGE : process(clk_i, rst_ni)
      variable h : integer;
    begin
      if rst_ni = '0' then
      elsif rising_edge(clk_i) then
        dsp_out_accum_results(f) <= (others => '0');
        for g in 0 to (ACCL_NUM - FU_NUM) loop
          if multithreaded_accl_en = 1 then
            h := g;  -- set the spm rd/wr ports equal to the "for-loop"
          elsif multithreaded_accl_en = 0 then
            h := f;  -- set the spm rd/wr ports equal to the "for-generate" 
          end if;
          case state_DSP(h) is
            when dsp_exec =>
              if (decoded_instruction_DSP_lat(h)(KDOTP_bit_position)   = '1'  or -- acccumulate 32-bit types
                  decoded_instruction_DSP_lat(h)(KDOTPPS_bit_position) = '1'  or
                  decoded_instruction_DSP_lat(h)(KVRED_bit_position)   = '1') and
                  MVTYPE_DSP(h) = "10" then
                if (accum_stage_1_en(h) = '1' or recover_state_wires(h) = '1') and halt_dsp_lat(h) = '0' then
                  accum_partial_results_stg_1(f)(31 downto 0)  <= std_logic_vector(unsigned(dsp_in_accum_operands(f)(31 downto 0))  + unsigned(dsp_in_accum_operands(f)(63  downto 32)));
                end if;
                if (accum_stage_2_en(h) = '1' or recover_state_wires(h) = '1') and halt_dsp_lat(h) = '0' then
                  dsp_out_accum_results(f) <= std_logic_vector(unsigned(accum_partial_results_stg_1(f)(31 downto 0)) +
                                                            unsigned(dsp_out_accum_results(f)));
                end if;
              elsif (decoded_instruction_DSP_lat(h)(KDOTP_bit_position)    = '1'  or  -- acccumulate 8-bit and 16-bit types
                     decoded_instruction_DSP_lat(h)(KDOTPPS_bit_position)  = '1'  or 
                     decoded_instruction_DSP_lat(h)(KVRED_bit_position)    = '1') and
                    (MVTYPE_DSP(h) = "01" or MVTYPE_DSP(h) = "00") then
                if (accum_stage_1_en(h) = '1' or recover_state_wires(h) = '1') and halt_dsp_lat(h) = '0' then
                  accum_partial_results_stg_1(f)(15 downto 0)  <= std_logic_vector(unsigned(dsp_in_accum_operands(f)(15 downto 0))   + unsigned(dsp_in_accum_operands(f)(31  downto 16)));
                  accum_partial_results_stg_1(f)(31 downto 16) <= std_logic_vector(unsigned(dsp_in_accum_operands(f)(47 downto 32))  + unsigned(dsp_in_accum_operands(f)(63 downto 48)));
                end if;
                if (accum_stage_2_en(h) = '1' or recover_state_wires(h) = '1') and halt_dsp_lat(h) = '0' then
                  dsp_out_accum_results(f) <= std_logic_vector(unsigned(accum_partial_results_stg_1(f)(15 downto 0))  + 
                                                            unsigned(accum_partial_results_stg_1(f)(31 downto 16)) +
                                                            unsigned(dsp_out_accum_results(f)));                
                end if;
              end if;
            when others =>
              null;
          end case;
        end loop;
      end if;
    end process; 
  end generate ACCUM_SIMD_2;

  ACCUM_SIMD_4 : if SIMD=4 generate
    fsm_ACCUM_STAGE : process(clk_i, rst_ni)
      variable h : integer;
    begin
      if rst_ni = '0' then
      elsif rising_edge(clk_i) then
        dsp_out_accum_results(f) <= (others => '0');
        for g in 0 to (ACCL_NUM - FU_NUM) loop
          if multithreaded_accl_en = 1 then
            h := g;  -- set the spm rd/wr ports equal to the "for-loop"
          elsif multithreaded_accl_en = 0 then
            h := f;  -- set the spm rd/wr ports equal to the "for-generate" 
          end if;
          case state_DSP(h) is
            when dsp_exec =>
              if (decoded_instruction_DSP_lat(h)(KDOTP_bit_position)   = '1'  or -- acccumulate 32-bit types
                  decoded_instruction_DSP_lat(h)(KDOTPPS_bit_position) = '1'  or 
                  decoded_instruction_DSP_lat(h)(KVRED_bit_position)   = '1') and
                  MVTYPE_DSP(h) = "10" then
                if (accum_stage_1_en(h) = '1' or recover_state_wires(h) = '1') and halt_dsp_lat(h) = '0' then
                  accum_partial_results_stg_1(f)(31 downto 0)  <= std_logic_vector(unsigned(dsp_in_accum_operands(f)(31 downto 0))  + unsigned(dsp_in_accum_operands(f)(63  downto 32)));
                  accum_partial_results_stg_1(f)(63 downto 32) <= std_logic_vector(unsigned(dsp_in_accum_operands(f)(95 downto 64)) + unsigned(dsp_in_accum_operands(f)(127 downto 96)));
                end if;
                if (accum_stage_2_en(h) = '1' or recover_state_wires(h) = '1') and halt_dsp_lat(h) = '0' then
                  dsp_out_accum_results(f) <= std_logic_vector(unsigned(accum_partial_results_stg_1(f)(31 downto 0)) + 
                                                            unsigned(accum_partial_results_stg_1(f)(63 downto 32)) +
                                                            unsigned(dsp_out_accum_results(f)));
                end if;
              elsif (decoded_instruction_DSP_lat(h)(KDOTP_bit_position)    = '1'  or  -- acccumulate 8-bit and 16-bit types
                     decoded_instruction_DSP_lat(h)(KDOTPPS_bit_position)  = '1'  or 
                     decoded_instruction_DSP_lat(h)(KVRED_bit_position)    = '1') and
                    (MVTYPE_DSP(h) = "01" or MVTYPE_DSP(h) = "00") then
                if (accum_stage_1_en(h) = '1' or recover_state_wires(h) = '1') and halt_dsp_lat(h) = '0' then
                  accum_partial_results_stg_1(f)(15 downto 0)  <= std_logic_vector(unsigned(dsp_in_accum_operands(f)(15 downto 0))   + unsigned(dsp_in_accum_operands(f)(31  downto 16)));
                  accum_partial_results_stg_1(f)(31 downto 16) <= std_logic_vector(unsigned(dsp_in_accum_operands(f)(47 downto 32))  + unsigned(dsp_in_accum_operands(f)(63 downto 48)));
                  accum_partial_results_stg_1(f)(47 downto 32) <= std_logic_vector(unsigned(dsp_in_accum_operands(f)(79 downto 64))  + unsigned(dsp_in_accum_operands(f)(95 downto 80)));
                  accum_partial_results_stg_1(f)(63 downto 48) <= std_logic_vector(unsigned(dsp_in_accum_operands(f)(111 downto 96)) + unsigned(dsp_in_accum_operands(f)(127 downto 112)));
                end if;
                if (accum_stage_2_en(h) = '1' or recover_state_wires(h) = '1') and halt_dsp_lat(h) = '0' then
                  dsp_out_accum_results(f) <= std_logic_vector(unsigned(accum_partial_results_stg_1(f)(15 downto 0))  + 
                                                            unsigned(accum_partial_results_stg_1(f)(31 downto 16)) +
                                                            unsigned(accum_partial_results_stg_1(f)(47 downto 32)) +
                                                            unsigned(accum_partial_results_stg_1(f)(63 downto 48)) +
                                                            unsigned(dsp_out_accum_results(f)));                
                end if;
              end if;
            when others =>
              null;
          end case;
        end loop;
      end if;
    end process;
  end generate ACCUM_SIMD_4;

  ACCUM_SIMD_8 : if SIMD=8 generate
    fsm_ACCUM_STAGE : process(clk_i, rst_ni)
      variable h : integer;
    begin
      if rst_ni = '0' then
      elsif rising_edge(clk_i) then
        dsp_out_accum_results(f) <= (others => '0');
        for g in 0 to (ACCL_NUM - FU_NUM) loop
          if multithreaded_accl_en = 1 then
            h := g;  -- set the spm rd/wr ports equal to the "for-loop"
          elsif multithreaded_accl_en = 0 then
            h := f;  -- set the spm rd/wr ports equal to the "for-generate" 
          end if;
          case state_DSP(h) is
            when dsp_exec =>
              if (decoded_instruction_DSP_lat(h)(KDOTP_bit_position)   = '1'  or -- acccumulate 32-bit types
                  decoded_instruction_DSP_lat(h)(KDOTPPS_bit_position) = '1'  or
                  decoded_instruction_DSP_lat(h)(KVRED_bit_position)   = '1') and
                  MVTYPE_DSP(h) = "10" then
              if (accum_stage_1_en(h) = '1' or recover_state_wires(h) = '1') and halt_dsp_lat(h) = '0' then
                accum_partial_results_stg_1(f)(31 downto 0)   <= std_logic_vector(unsigned(dsp_in_accum_operands(f)(31 downto 0))  + unsigned(dsp_in_accum_operands(f)(63  downto 32)));
                accum_partial_results_stg_1(f)(63 downto 32)  <= std_logic_vector(unsigned(dsp_in_accum_operands(f)(95 downto 64)) + unsigned(dsp_in_accum_operands(f)(127 downto 96)));
                accum_partial_results_stg_1(f)(95 downto 64)  <= std_logic_vector(unsigned(dsp_in_accum_operands(f)(159 downto 128)) + unsigned(dsp_in_accum_operands(f)(191 downto 160)));
                accum_partial_results_stg_1(f)(127 downto 96) <= std_logic_vector(unsigned(dsp_in_accum_operands(f)(223 downto 192)) + unsigned(dsp_in_accum_operands(f)(255 downto 224)));
              end if;
              if (accum_stage_2_en(h) = '1' or recover_state_wires(h) = '1') and halt_dsp_lat(h) = '0' then
                dsp_out_accum_results(f) <= std_logic_vector(unsigned(accum_partial_results_stg_1(f)(31  downto 0))  + 
                                                          unsigned(accum_partial_results_stg_1(f)(63  downto 32)) +
                                                          unsigned(accum_partial_results_stg_1(f)(95  downto 64)) +
                                                          unsigned(accum_partial_results_stg_1(f)(127 downto 96)) +
                                                          unsigned(dsp_out_accum_results(f)));
              end if;
              elsif (decoded_instruction_DSP_lat(h)(KDOTP_bit_position)    = '1'  or  -- acccumulate 8-bit and 16-bit types
                     decoded_instruction_DSP_lat(h)(KDOTPPS_bit_position)  = '1'  or
                     decoded_instruction_DSP_lat(h)(KVRED_bit_position)    = '1') and
                    (MVTYPE_DSP(h) = "01" or MVTYPE_DSP(h) = "00") then
                if (accum_stage_1_en(h) = '1' or recover_state_wires(h) = '1') and halt_dsp_lat(h) = '0' then
                  accum_partial_results_stg_1(f)(15 downto 0)    <= std_logic_vector(unsigned(dsp_in_accum_operands(f)(15 downto 0))    + unsigned(dsp_in_accum_operands(f)(31  downto 16)));
                  accum_partial_results_stg_1(f)(31 downto 16)   <= std_logic_vector(unsigned(dsp_in_accum_operands(f)(47 downto 32))   + unsigned(dsp_in_accum_operands(f)(63 downto 48)));
                  accum_partial_results_stg_1(f)(47 downto 32)   <= std_logic_vector(unsigned(dsp_in_accum_operands(f)(79 downto 64))   + unsigned(dsp_in_accum_operands(f)(95 downto 80)));
                  accum_partial_results_stg_1(f)(63 downto 48)   <= std_logic_vector(unsigned(dsp_in_accum_operands(f)(111 downto 96))  + unsigned(dsp_in_accum_operands(f)(127 downto 112)));
                  accum_partial_results_stg_1(f)(79 downto 64)   <= std_logic_vector(unsigned(dsp_in_accum_operands(f)(143 downto 128)) + unsigned(dsp_in_accum_operands(f)(159 downto 144)));
                  accum_partial_results_stg_1(f)(95 downto 80)   <= std_logic_vector(unsigned(dsp_in_accum_operands(f)(175 downto 160)) + unsigned(dsp_in_accum_operands(f)(191 downto 176)));
                  accum_partial_results_stg_1(f)(111 downto 96)  <= std_logic_vector(unsigned(dsp_in_accum_operands(f)(207 downto 192)) + unsigned(dsp_in_accum_operands(f)(223 downto 208)));
                  accum_partial_results_stg_1(f)(127 downto 112) <= std_logic_vector(unsigned(dsp_in_accum_operands(f)(239 downto 224)) + unsigned(dsp_in_accum_operands(f)(255 downto 240)));
                end if;
                if (accum_stage_2_en(h) = '1' or recover_state_wires(h) = '1') and halt_dsp_lat(h) = '0' then
                  dsp_out_accum_results(f) <= std_logic_vector(unsigned(accum_partial_results_stg_1(f)(15  downto 0))  + 
                                                            unsigned(accum_partial_results_stg_1(f)(31  downto 16)) +
                                                            unsigned(accum_partial_results_stg_1(f)(47  downto 32)) +
                                                            unsigned(accum_partial_results_stg_1(f)(63  downto 48)) +
                                                            unsigned(accum_partial_results_stg_1(f)(79  downto 64)) +
                                                            unsigned(accum_partial_results_stg_1(f)(95  downto 80)) +
                                                            unsigned(accum_partial_results_stg_1(f)(111 downto 96)) +
                                                            unsigned(accum_partial_results_stg_1(f)(127 downto 112)) +
                                                            unsigned(dsp_out_accum_results(f)));                
                end if;
              end if;
            when others =>
              null;
          end case;
        end loop;
      end if;
    end process;
  end generate ACCUM_SIMD_8;

  end generate ACCUM_replicated;

------------------------------------------------------------------------ end of ACCUM Unit -------
--------------------------------------------------------------------------------------------------  

end ACCUM_STG;
--------------------------------------------------------------------------------------------------
-- END of ACCUM Unit architecture ----------------------------------------------------------------
--------------------------------------------------------------------------------------------------
