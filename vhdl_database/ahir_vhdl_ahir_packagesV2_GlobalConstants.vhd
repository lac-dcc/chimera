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
package GlobalConstants is
    constant global_debug_flag: boolean := false;
    constant global_pipe_report_flag: boolean := true;
    constant global_use_vivado_bbank_dual_port : boolean := true;
    constant global_use_vivado_distributed_ram_queue : boolean := true;

    -- clock gating using Xilinx IP?
    constant use_xilinx_bufce: boolean := true;

    --
    -- for guarded statements... increase this with care!
    --
    constant max_single_bit_queue_depth_per_stage : integer := 16;  -- this is huge.. make it smaller for effect (carefully)

    -- threshold for deciding if a pipe is deep or shallow
    -- pipes shallower than this are implemented using FF's
    -- this or deeper pipes with DPRAM.  Note: this is a hack!
    constant global_pipe_shallowness_threshold : integer := 10;  


    -- use the optimized unload buffer implementation if possible.
    -- this saves a substantial amount of logic, but  can result
    -- in a slight (2.5%) performance reduction.  use it for the
    -- minimizing resource usage.
    constant global_use_optimized_unload_buffer : boolean := false;

end package GlobalConstants;
