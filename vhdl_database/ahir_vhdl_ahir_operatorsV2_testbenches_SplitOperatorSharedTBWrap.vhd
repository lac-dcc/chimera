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
use ieee.numeric_std.all;

library ahir;
use ahir.Types.all;
use ahir.Subprograms.all;
use ahir.Utilities.all;
use ahir.BaseComponents.all;

entity SplitOperatorSharedTBWrap is
end SplitOperatorSharedTBWrap;

architecture Behave of SplitOperatorSharedTBWrap is
begin
   tb0: SplitOperatorSharedTB generic map(g_num_req => 1,
                                          operator_id => "ApIntAdd",
                                          zero_delay => true,
                                          verbose_mode => false,
                                          input_data_width => 8,
                                          output_data_width => 8,
                                          num_ips => 2,
                                          tb_id => "ApIntAdd num_req=1 ");  
   tb1: SplitOperatorSharedTB generic map(g_num_req => 2,
                                          operator_id => "ApIntAdd",
                                          zero_delay => false,
                                          verbose_mode => false,
                                          input_data_width => 8,
                                          output_data_width => 8,
                                          num_ips => 2,
                                          tb_id => "ApIntAdd num_req=2 ");
   tb2: SplitOperatorSharedTB generic map(g_num_req => 5,
                                          operator_id => "ApIntAdd",
                                          zero_delay => true,
                                          verbose_mode => false,
                                          input_data_width => 8,
                                          output_data_width => 8,
                                          num_ips => 2,
                                          tb_id => "ApIntAdd num_req=5 ");
end Behave;
