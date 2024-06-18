// This program was cloned from: https://github.com/ultraembedded/core_jpeg_decoder
// License: Apache License 2.0

//-----------------------------------------------------------------
//                       AXI-4 JPEG Decoder
//                             V0.2
//                       Ultra-Embedded.com
//                        Copyright 2020
//
//                   admin@ultra-embedded.com
//-----------------------------------------------------------------
//                      License: Apache 2.0
// This IP can be freely used in commercial projects, however you may
// want access to unreleased materials such as verification environments,
// or test vectors, as well as changes to the IP for integration purposes.
// If this is the case, contact the above address.
// I am interested to hear how and where this IP is used, so please get
// in touch!
//-----------------------------------------------------------------
// Copyright 2020 Ultra-Embedded.com
// 
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
// 
//     http://www.apache.org/licenses/LICENSE-2.0
// 
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
//-----------------------------------------------------------------

`define JPEG_CTRL    8'h0

    `define JPEG_CTRL_START      31
    `define JPEG_CTRL_START_DEFAULT    0
    `define JPEG_CTRL_START_B          31
    `define JPEG_CTRL_START_T          31
    `define JPEG_CTRL_START_W          1
    `define JPEG_CTRL_START_R          31:31

    `define JPEG_CTRL_ABORT      30
    `define JPEG_CTRL_ABORT_DEFAULT    0
    `define JPEG_CTRL_ABORT_B          30
    `define JPEG_CTRL_ABORT_T          30
    `define JPEG_CTRL_ABORT_W          1
    `define JPEG_CTRL_ABORT_R          30:30

    `define JPEG_CTRL_LENGTH_DEFAULT    0
    `define JPEG_CTRL_LENGTH_B          0
    `define JPEG_CTRL_LENGTH_T          23
    `define JPEG_CTRL_LENGTH_W          24
    `define JPEG_CTRL_LENGTH_R          23:0

`define JPEG_STATUS    8'h4

    `define JPEG_STATUS_BUSY      0
    `define JPEG_STATUS_BUSY_DEFAULT    0
    `define JPEG_STATUS_BUSY_B          0
    `define JPEG_STATUS_BUSY_T          0
    `define JPEG_STATUS_BUSY_W          1
    `define JPEG_STATUS_BUSY_R          0:0

`define JPEG_SRC    8'h8

    `define JPEG_SRC_ADDR_DEFAULT    0
    `define JPEG_SRC_ADDR_B          0
    `define JPEG_SRC_ADDR_T          31
    `define JPEG_SRC_ADDR_W          32
    `define JPEG_SRC_ADDR_R          31:0

`define JPEG_DST    8'hc

    `define JPEG_DST_ADDR_DEFAULT    0
    `define JPEG_DST_ADDR_B          0
    `define JPEG_DST_ADDR_T          31
    `define JPEG_DST_ADDR_W          32
    `define JPEG_DST_ADDR_R          31:0

