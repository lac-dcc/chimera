// $Id: vcr_constants.v 5188 2012-08-30 00:31:31Z dub $

/*
 Copyright (c) 2007-2012, Trustees of The Leland Stanford Junior University
 All rights reserved.

 Redistribution and use in source and binary forms, with or without
 modification, are permitted provided that the following conditions are met:

 Redistributions of source code must retain the above copyright notice, this 
 list of conditions and the following disclaimer.
 Redistributions in binary form must reproduce the above copyright notice, this
 list of conditions and the following disclaimer in the documentation and/or
 other materials provided with the distribution.

 THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
 ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
 WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE 
 DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR
 ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
 (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
 LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON
 ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
 (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
 SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
*/

//==============================================================================
// VC router related constant definitions
//==============================================================================


//------------------------------------------------------------------------------
// VC allocator implementation variants
//------------------------------------------------------------------------------

// separable, input-first
`define VC_ALLOC_TYPE_SEP_IF    0

// separable, output-first
`define VC_ALLOC_TYPE_SEP_OF    1

// wavefront-based
// (note: add WF_ALLOC_TYPE_* constant to select wavefront variant)
`define VC_ALLOC_TYPE_WF_BASE   2
`define VC_ALLOC_TYPE_WF_LIMIT  (`VC_ALLOC_TYPE_WF_BASE + `WF_ALLOC_TYPE_LAST)

`define VC_ALLOC_TYPE_LAST `VC_ALLOC_TYPE_WF_LIMIT


//------------------------------------------------------------------------------
// switch allocator implementation variants
//------------------------------------------------------------------------------

// separable, input-first
`define SW_ALLOC_TYPE_SEP_IF   0

// separable, output-first
`define SW_ALLOC_TYPE_SEP_OF   1

// wavefront-based
// (note: add WF_ALLOC_TYPE_* constant to select wavefront variant)
`define SW_ALLOC_TYPE_WF_BASE  2
`define SW_ALLOC_TYPE_WF_LIMIT (`SW_ALLOC_TYPE_WF_BASE + `WF_ALLOC_TYPE_LAST)

`define SW_ALLOC_TYPE_LAST `SW_ALLOC_TYPE_WF_LIMIT


//------------------------------------------------------------------------------
// speculation types for switch allocator
//------------------------------------------------------------------------------

// disable speculative switch allocation
`define SW_ALLOC_SPEC_TYPE_NONE 0

// use speculative grants when not conflicting with non-spec requests
`define SW_ALLOC_SPEC_TYPE_REQ  1

// use speculative grants when not conflicting with non-spec grants
`define SW_ALLOC_SPEC_TYPE_GNT  2

// use single allocator, but prioritize non-speculative requrests
`define SW_ALLOC_SPEC_TYPE_PRIO 3

`define SW_ALLOC_SPEC_TYPE_LAST `SW_ALLOC_SPEC_TYPE_PRIO
