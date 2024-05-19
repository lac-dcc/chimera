// This program was cloned from: https://github.com/b224hisl/rioschip
// License: Apache License 2.0

////////////////////////////////////////////////////////////////////////////////                                          
// SPDX-FileCopyrightText: 2022, Jure Vreca                                   //                                          
//                                                                            //                                          
// Licenseunder the Apache License, Version 2.0(the "License");               //                                          
// you maynot use this file except in compliance with the License.            //                                           
// You may obtain a copy of the License at                                    //                                          
//                                                                            //                                          
//      http://www.apache.org/licenses/LICENSE-2.0                            //                                          
//                                                                            //                                          
// Unless required by applicable law or agreed to in writing, software        //                                          
// distributed under the License is distributed on an "AS IS" BASIS,          //                                          
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.   //                                          
// See the License for the specific language governing permissions and        //                                          
// limitations under the License.                                             //                                          
// SPDX-License-Identifier: Apache-2.0                                        //                                          
// SPDX-FileContributor: Jure Vreca <jurevreca12@gmail.com>                   //                                          
////////////////////////////////////////////////////////////////////////////////      

`define JEDRO_1_BOOT_ADDR 	  (32'h3000_0000)

`define IRAM_BASE_ADDR        (32'h3000_0000)
`define IRAM_ADDR_WIDTH_BYTES ($clog2(2048))
`define IRAM_ADDR_WIDTH_WORDS (`IRAM_ADDR_WIDTH_BYTES - 2)
`define IRAM_ADDR_WIDTH_WORDS_PER_MACRO (`IRAM_ADDR_WIDTH_WORDS - 1)

`define DRAM_BASE_ADDR        (32'h3000_4000)
`define DRAM_ADDR_WIDTH_BYTES ($clog2(1024))
`define DRAM_ADDR_WIDTH_WORDS (`DRAM_ADDR_WIDTH_BYTES - 2)

`define RVJ1_GPIO_BASE_ADDR   (32'h3001_0000)
`define RVJ1_TIMER_BASE_ADDR  (32'h3002_0000)
