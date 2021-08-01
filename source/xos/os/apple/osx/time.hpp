///////////////////////////////////////////////////////////////////////
/// Copyright (c) 1988-2020 $organization$
///
/// This software is provided by the author and contributors ``as is'' 
/// and any express or implied warranties, including, but not limited to, 
/// the implied warranties of merchantability and fitness for a particular 
/// purpose are disclaimed. In no event shall the author or contributors 
/// be liable for any direct, indirect, incidental, special, exemplary, 
/// or consequential damages (including, but not limited to, procurement 
/// of substitute goods or services; loss of use, data, or profits; or 
/// business interruption) however caused and on any theory of liability, 
/// whether in contract, strict liability, or tort (including negligence 
/// or otherwise) arising in any way out of the use of this software, 
/// even if advised of the possibility of such damage.
///
///   File: time.hpp
///
/// Author: $author$
///   Date: 1/26/2020
///////////////////////////////////////////////////////////////////////
#ifndef XOS_OS_APPLE_OSX_TIME_HPP
#define XOS_OS_APPLE_OSX_TIME_HPP

#include "xos/os/posix/time.hpp"

namespace xos {
namespace os {
namespace apple {
namespace osx {

/// clock_gettime
inline int clock_gettime(clockid_t clk_id, struct timespec *res) {
    return posix::clock_gettime(clk_id, res);
}

/// gettimeofday
inline int gettimeofday(struct timeval* tv, void* p) {
    return posix::gettimeofday(tv, p);
}

} /// namespace osx
} /// namespace apple
} /// namespace os
} /// namespace xos

#endif /// XOS_OS_APPLE_OSX_TIME_HPP
