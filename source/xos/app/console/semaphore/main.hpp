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
///   File: main.hpp
///
/// Author: $author$
///   Date: 1/4/2020
///////////////////////////////////////////////////////////////////////
#ifndef XOS_APP_CONSOLE_SEMAPHORE_MAIN_HPP
#define XOS_APP_CONSOLE_SEMAPHORE_MAIN_HPP

#include "xos/app/console/semaphore/main_opt.hpp"
#include "xos/mt/microsoft/windows/semaphore.hpp"
#include "xos/mt/apple/osx/semaphore.hpp"
#include "xos/mt/oracle/solaris/semaphore.hpp"
#include "xos/mt/mach/semaphore.hpp"
#include "xos/mt/linux/semaphore.hpp"
#include "xos/mt/posix/semaphore.hpp"
#include "xos/mt/os/semaphore.hpp"
#include "xos/mt/os/posix/semaphore.hpp"
#include "xos/mt/semaphore.hpp"

namespace xos {
namespace app {
namespace console {
namespace semaphore {

/// class maint
template 
<class TExtends = main_opt, 
 class TImplements = typename TExtends::implements>

class exported maint: virtual public TImplements, public TExtends {
public:
    typedef TImplements implements;
    typedef TExtends extends;
    typedef maint derives;

    typedef typename extends::string_t string_t;
    typedef typename extends::char_t char_t;
    typedef typename extends::end_char_t end_char_t;
    enum { end_char = extends::end_char };

    /// constructor / destructor
    maint() {
    }
    virtual ~maint() {
    }
private:
    maint(const maint& copy) {
    }

protected:
    /// ...run
    virtual int windows_run(int argc, char_t** argv, char_t** env) {
        return this->template run< ::xos::mt::microsoft::windows::semaphore >();
    }
    virtual int osx_run(int argc, char_t** argv, char_t** env) {
        return this->template run< ::xos::mt::apple::mach::semaphore >();
    }
    virtual int solaris_run(int argc, char_t** argv, char_t** env) {
        return this->template run< ::xos::mt::oracle::solaris::semaphore >();
    }
    virtual int mach_run(int argc, char_t** argv, char_t** env) {
        return this->template run< ::xos::mt::mach::semaphore >();
    }
    virtual int linux_run(int argc, char_t** argv, char_t** env) {
        return this->template run< ::xos::mt::linux::semaphore >();
    }
    virtual int posix_run(int argc, char_t** argv, char_t** env) {
        return this->template run< ::xos::mt::posix::semaphore >();
    }
    virtual int to_posix_run(int argc, char_t** argv, char_t** env) {
        return this->template run< ::xos::mt::os::posix::semaphore >();
    }
    virtual int os_run(int argc, char_t** argv, char_t** env) {
        return this->template run< ::xos::mt::os::semaphore >();
    }
    virtual int derived_run(int argc, char_t** argv, char_t** env) {
        return this->template run< ::xos::mt::derived::semaphore >();
    }
    virtual int default_run(int argc, char_t** argv, char_t** env) {
        return this->os_run(argc, argv, env);
    }
}; /// class maint
typedef maint<> main;

} /// namespace semaphore
} /// namespace console
} /// namespace app
} /// namespace xos

#endif /// ndef XOS_APP_CONSOLE_SEMAPHORE_MAIN_HPP 
