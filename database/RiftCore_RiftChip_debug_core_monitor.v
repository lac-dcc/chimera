// This program was cloned from: https://github.com/whutddk/RiftCore
// License: Apache License 2.0

/*
* @File name: core_monitor
* @Author: Ruige Lee
* @Email: wut.ruigeli@gmail.com
* @Date:   2020-11-26 19:01:43
* @Last Modified by:   Ruige Lee
* @Last Modified time: 2021-01-03 12:08:41
*/

/*
  Copyright (c) 2020 - 2021 Ruige Lee <wut.ruigeli@gmail.com>

   Licensed under the Apache License, Version 2.0 (the "License");
   you may not use this file except in compliance with the License.
   You may obtain a copy of the License at

	   http://www.apache.org/licenses/LICENSE-2.0

   Unless required by applicable law or agreed to in writing, software
   distributed under the License is distributed on an "AS IS" BASIS,
   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
   See the License for the specific language governing permissions and
   limitations under the License.
*/


`timescale 1 ns / 1 ps


module core_monitor (
	input reqReset,
	output hasReset,

	input reqHalt,
	output isHalt,

	output isDebugMode,


	


input [127:0] accessReg_arg,
input [15:0] accessReg_addr,
input accessReg_wen,
output [127:0] accessReg_res,
output accessReg_ready,
input accessReg_valid,


input quickAccess_valid,
output isExpection,
output quickAccess_ready,

);










endmodule







