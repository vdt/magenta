// Copyright 2016 The Fuchsia Authors
//
// Use of this source code is governed by a MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT
#pragma once

#include <magenta/compiler.h>

__BEGIN_CDECLS

void x86_tsc_adjust(void);
void x86_tsc_store_adjustment(void);

__END_CDECLS
