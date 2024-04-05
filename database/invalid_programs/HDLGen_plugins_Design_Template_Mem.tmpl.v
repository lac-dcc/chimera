//##############################################################################################################
//##############################################################################################################
//##############################################################################################################
//###                         Copyright 2022~2023 Wilson Chen                                                ###
//###            Licensed under the Apache License, Version 2.0 (the "License");                             ###
//###            You may not use this file except in compliance with the License.                            ###
//###            You may obtain a copy of the License at                                                     ###
//###                    http://www.apache.org/licenses/LICENSE-2.0                                          ###
//###            Unless required by applicable law or agreed to in writing, software                         ###
//###            distributed under the License is distributed on an "AS IS" BASIS,                           ###
//###            WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.                    ###
//###            See the License for the specific language governing permissions and                         ###
//###            limitations under the License.                                                              ###
//##############################################################################################################
//##############################################################################################################
//##############################################################################################################

//================================================================================================
//======= this is internal design for Mem module ===============
//================================================================================================
//// default module name is : Mem

module <:$mod_name:>
  parameter DATA_WIDTH = <:$dwd:>;
  parameter DATA_DEPTH = <:$depth:>;
  parameter ADDR_WIDTH  = <:$awd:>;
(
  input  wire                    <:$clk:>,
  input  wire                    rstn,
  
  // You need to change ports to your specific design
  input  wire                    wr_en,
  input  wire [ADD_WIDTH-1:0]    wr_addr,
  input  wire                    rd_en,
  input  wire [ADD_WIDTH-1:0]    rd_addr,

  output  wire [DATA_WIDTH-1:0]  rd_out
);

<:
	if ($en ) {
		$OUT .= " // Please add Enable Control logic here";
	}

	if ($test ) {
		$OUT .= " // Please add Test OCC_CLK Control logic here";
	}
:>



//=======================================================================================================================
// Please add your implement logic below ,
// Please add any cfg parameter in _Cfg.json, and used in code as a variabe of  {$var}
//=======================================================================================================================



endmodule
