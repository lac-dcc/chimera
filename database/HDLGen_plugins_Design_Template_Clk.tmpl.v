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
//======= this is internal design for Clk ===============
//================================================================================================
//// default module name is : Clk_Gen

module <:$mod_name:> 
(
  input  wire                    <:$clk:>,
  input  wire                    rstn,
  
  // You need to change ports to your specific design
  input  wire                    <:$en:>,

  input  wire  [2:0]             <:$clk_sel:>,
  input  wire  [5:0]             <:$divn:>,
  
  input  wire                    <:$src0:>,
  input  wire                    <:$src1:>,
  input  wire                    <:$src2:>,
  input  wire                    <:$src3:>,
  input  wire                    <:$src4:>,
  input  wire                    <:$src5:>,
  input  wire                    <:$src6:>,
  input  wire                    <:$src7:>,

<:
if ($test ==1) {
  $VOUT .= "
  input wire                     $occ_clk,
  input wire                     TEST_EN,
  input wire                     SCAN_EN,
  ";
  }
:>

  output wire                    <:$oclk:>,   
);

<:
	if ($test ) {
		$OUT .= " // Please add Test OCC_CLK Control logic here";
	}
:>


//=======================================================================================================================
// Please add your implement logic below ,
// Please add any cfg parameter in _Cfg.json, and used in code as a variabe of  {$var}
//=======================================================================================================================




endmodule
