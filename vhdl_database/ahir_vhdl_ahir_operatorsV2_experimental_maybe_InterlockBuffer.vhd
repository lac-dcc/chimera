------------------------------------------------------------------------------------------------
--
-- Copyright (C) 2010-: Madhav P. Desai
-- All Rights Reserved.
--  
-- Permission is hereby granted, free of charge, to any person obtaining a
-- copy of this software and associated documentation files (the
-- "Software"), to deal with the Software without restriction, including
-- without limitation the rights to use, copy, modify, merge, publish,
-- distribute, sublicense, and/or sell copies of the Software, and to
-- permit persons to whom the Software is furnished to do so, subject to
-- the following conditions:
-- 
--  * Redistributions of source code must retain the above copyright
--    notice, this list of conditions and the following disclaimers.
--  * Redistributions in binary form must reproduce the above
--    copyright notice, this list of conditions and the following
--    disclaimers in the documentation and/or other materials provided
--    with the distribution.
--  * Neither the names of the AHIR Team, the Indian Institute of
--    Technology Bombay, nor the names of its contributors may be used
--    to endorse or promote products derived from this Software
--    without specific prior written permission.
--
-- THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
-- OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
-- MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
-- IN NO EVENT SHALL THE CONTRIBUTORS OR COPYRIGHT HOLDERS BE LIABLE FOR
-- ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
-- TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
-- SOFTWARE OR THE USE OR OTHER DEALINGS WITH THE SOFTWARE.
------------------------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;

library ahir;
use ahir.Types.all;
use ahir.Subprograms.all;
use ahir.Utilities.all;
use ahir.BaseComponents.all;

-- Synopsys DC ($^^$@!)  needs you to declare an attribute
-- to infer a synchronous set/reset ... unbelievable.
--##decl_synopsys_attribute_lib##

entity InterlockBuffer is
  generic (name: string; buffer_size: integer := 2; 
  	in_data_width : integer := 32;
  	out_data_width : integer := 32;
  	flow_through: boolean := false;
	cut_through : boolean := false;
  	bypass_flag : boolean := false);
  port (write_req: in boolean;
        write_ack: out boolean;
        write_data: in std_logic_vector(in_data_width-1 downto 0);
        read_req: in boolean;
        read_ack: out boolean;
        read_data: out std_logic_vector(out_data_width-1 downto 0);
        clk : in std_logic;
        reset: in std_logic);
end InterlockBuffer;

architecture default_arch of InterlockBuffer is

  constant data_width: integer := Minimum(in_data_width,out_data_width);

  signal buf_write_req, buf_write_ack: std_logic;
  signal buf_write_data, buf_read_data:  std_logic_vector(data_width-1 downto 0);

  type LoadFsmState is (l_idle, l_busy);
  signal l_fsm_state : LoadFsmState;

  signal has_data: std_logic;

  constant use_unload_register : boolean := not cut_through;
  constant use_special_single_stage: boolean := (buffer_size = 1);
  
-- see comment above..
--##decl_synopsys_sync_set_reset##

begin  -- default_arch

  -- interlock buffer must have buffer-size > 0
  assert buffer_size > 0 report " interlock buffer size must be > 0 " severity failure;
  
  flowThrough: if flow_through generate

    write_ack <= write_req;
    read_ack <= read_req;

    inSmaller: if in_data_width <= out_data_width generate
      process(write_data)
        variable rvar : std_logic_vector(out_data_width-1 downto 0);
      begin
        rvar := (others => '0');
        rvar(in_data_width-1 downto 0) := write_data;
        read_data <= rvar;
      end process;
    end generate inSmaller;

    outSmaller: if out_data_width < in_data_width generate
      read_data <= write_data(out_data_width-1 downto 0);
    end generate outSmaller;

  end generate flowThrough;

  NoFlowThrough: if (not flow_through) generate

    interlockBuf: if (buffer_size > 0) generate
      inSmaller: if in_data_width <= out_data_width generate
        buf_write_data <= write_data;
  
        process(buf_read_data)
          begin
          read_data <= (others => '0');
          read_data(data_width-1 downto 0)  <= buf_read_data;
        end process;
      end generate inSmaller;
  
      outSmaller: if out_data_width < in_data_width generate
        buf_write_data <= write_data(data_width-1 downto 0);
        read_data  <= buf_read_data;
      end generate outSmaller;
    
      SpecialSingleStageGen: if use_special_single_stage generate
        bb: block
          signal joined_sig: boolean;
	  signal buf_data_register : std_logic_vector(data_width-1 downto 0);
        begin
          j2_inst: join2
		generic map (bypass => true, name => name & ":join2")
		port map (pred0 => write_req, pred1 => read_req,
				symbol_out => joined_sig, clk => clk, reset => reset);
	  write_ack <= joined_sig;
	  process(clk, reset, joined_sig, buf_write_data)
	  begin
		if(clk'event and (clk = '1')) then
			if(reset = '1') then
				read_ack <= false;
				-- buf_data_register <= (others => '0');
			else
				read_ack <= joined_sig;
				buf_data_register <= buf_write_data;
			end if;
		end if;
	  end process;
          buf_read_data <= buf_data_register;
        end block;
      end generate SpecialSingleStageGen;

  
      NormalInterlockBuf: if (not use_special_single_stage) generate
        -- write FSM to pipe.
        process(clk,reset, l_fsm_state, buf_write_ack, write_req)
          variable nstate : LoadFsmState;
        begin
          nstate := l_fsm_state;
          buf_write_req <= '0';
          write_ack <= false;
          if(l_fsm_state = l_idle) then
	    if(write_req) then
              buf_write_req <= '1';
              if(buf_write_ack = '1') then
                write_ack <= true;
              else
                nstate := l_busy;
              end if;
	    end if;
          else
	    buf_write_req <= '1';
	    if(buf_write_ack = '1') then
              nstate := l_idle;
              write_ack <= true;
	    end if;
          end if;
    
          if(clk'event and clk = '1') then
	    if(reset = '1') then
              l_fsm_state <= l_idle;
	    else
              l_fsm_state <= nstate;
	    end if;
          end if;
        end process;
  
        -- the unload buffer.
        buf : UnloadBuffer generic map (
          name =>  name & " buffer ",
          data_width => data_width,
          buffer_size => buffer_size, 
	  use_unload_register => use_unload_register,
          bypass_flag => bypass_flag)
          port map (
            write_req   => buf_write_req,
            write_ack   => buf_write_ack,
            write_data  => buf_write_data,
            unload_req  => read_req,
            unload_ack  => read_ack,
            read_data   => buf_read_data,
 	    has_data => has_data,
            clk         => clk,
            reset       => reset);

      end generate NormalInterlockBuf;
    end generate interlockBuf;
  end generate NoFlowThrough;

end default_arch;
