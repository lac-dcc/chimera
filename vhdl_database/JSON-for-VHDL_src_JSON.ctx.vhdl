-- EMACS settings: -*-  tab-width: 2; indent-tabs-mode: t -*-
-- vim: tabstop=2:shiftwidth=2:noexpandtab
-- kate: tab-width 2; replace-tabs off; indent-width 2;
--
-- =============================================================================
--       _ ____   ___  _   _        __              __     ___   _ ____  _
--      | / ___| / _ \| \ | |      / _| ___  _ __   \ \   / / | | |  _ \| |
--   _  | \___ \| | | |  \| |_____| |_ / _ \| '__|___\ \ / /| |_| | | | | |
--  | |_| |___) | |_| | |\  |_____|  _| (_) | | |_____\ V / |  _  | |_| | |___
--   \___/|____/ \___/|_| \_|     |_|  \___/|_|        \_/  |_| |_|____/|_____|
--
-- =============================================================================
-- Authors:					1138-4EB [GitHub User]
--
-- Package:					JSON context and public API
--
-- Description:
-- ------------------------------------
--		For detailed documentation see below.
--
-- License:
-- ============================================================================
-- Copyright 2007-2018 Patrick Lehmann - Dresden, Germany
--
-- Licensed under the Apache License, Version 2.0 (the "License");
-- you may not use this file except in compliance with the License.
-- You may obtain a copy of the License at
--
--		http://www.apache.org/licenses/LICENSE-2.0
--
-- Unless required by applicable law or agreed to in writing, software
-- distributed under the License is distributed on an "AS IS" BASIS,
-- WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
-- See the License for the specific language governing permissions and
-- limitations under the License.
-- ============================================================================

context json_ctx is
  library JSON;
  use JSON.json.T_JSON;
  use JSON.json.jsonLoad;
  use JSON.json.jsonNoParserError;
  use JSON.json.jsonGetErrorMessage;
  use JSON.json.jsonGetContent;
  use JSON.json.jsonGetBoolean;
  use JSON.json.jsonGetString;
  use JSON.json.jsonGetIntegerArray;
  use JSON.json.jsonIsBoolean;
  use JSON.json.jsonIsNull;
  use JSON.json.jsonIsString;
  use JSON.json.jsonIsNumber;
end context;
