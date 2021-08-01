///////////////////////////////////////////////////////////////////////
/// Copyright (c) 1988-2019 $organization$
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
///   Date: 12/26/2019
///////////////////////////////////////////////////////////////////////
#ifndef XOS_APP_CONSOLE_MT_MAIN_HPP
#define XOS_APP_CONSOLE_MT_MAIN_HPP

#include "xos/app/console/mt/main_opt.hpp"

namespace xos {
namespace app {
namespace console {
namespace mt {

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
    maint(): threads_(0), sleep_((mseconds_t)-1), timeout_((mseconds_t)-1) {
    }
    virtual ~maint() {
    }
private:
    maint(const maint& copy) {
    }

protected:
    /// ...option...
    virtual int on_threads_option
    (int optval, const char_t* optarg,
     const char_t* optname, int optind,
     int argc, char_t**argv, char_t**env) {
        int err = 0;
        if ((optarg) && (optarg[0])) {
            string_t opt(optarg);
            unsigned to = opt.to_unsigned();
            set_threads(to);
        }
        return err;
    }
    virtual int on_sleep_option
    (int optval, const char_t* optarg,
     const char_t* optname, int optind,
     int argc, char_t**argv, char_t**env) {
        int err = 0;
        if ((optarg) && (optarg[0])) {
            string_t opt(optarg);
            unsigned to = opt.to_unsigned();
            set_sleep(to);
        }
        return err;
    }
    virtual int on_timeout_option
    (int optval, const char_t* optarg,
     const char_t* optname, int optind,
     int argc, char_t**argv, char_t**env) {
        int err = 0;
        if ((optarg) && (optarg[0])) {
            string_t opt(optarg);
            unsigned to = opt.to_unsigned();
            set_timeout(to);
        }
        return err;
    }

    /// ...threads / ...sleep / ...timeout
    virtual size_t set_threads(size_t to) {
        threads_ = to;
        return threads_;
    }
    virtual size_t threads() const {
        return threads_;
    }
    virtual mseconds_t set_sleep(mseconds_t to) {
        sleep_ = to;
        return sleep_;
    }
    virtual mseconds_t sleep() const {
        return sleep_;
    }
    virtual bool infinite_sleep(mseconds_t& timeout) const {
        return ((timeout = sleep_) == ((mseconds_t)-1));
    }
    virtual mseconds_t set_timeout(mseconds_t to) {
        timeout_ = to;
        return timeout_;
    }
    virtual mseconds_t timeout() const {
        return timeout_;
    }
    virtual bool infinite_timeout(mseconds_t& timeout) const {
        return ((timeout = timeout_) == ((mseconds_t)-1));
    }

protected:
    size_t threads_;
    mseconds_t sleep_, timeout_;
}; /// class maint
typedef maint<> main;

namespace os {
/// class maint
template 
<class TExtends = mt::maint<mt::os::main_opt>, 
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
    maint(): run_(0) {
    }
    virtual ~maint() {
    }
private:
    maint(const maint& copy) {
    }

protected:
    /// ...run
    int (derives::*run_)(int argc, char_t** argv, char_t** env);
    virtual int run(int argc, char_t** argv, char_t** env) {
        if ((run_)) {
            return (this->*run_)(argc, argv, env);
        }
        return this->os_run(argc, argv, env);
    }
    virtual int os_run(int argc, char_t** argv, char_t** env) {
        return this->usage(argc, argv, env);
    }
}; /// class maint
typedef maint<> main;
} /// namespace os

} /// namespace mt
} /// namespace console
} /// namespace app
} /// namespace xos

#endif /// ndef XOS_APP_CONSOLE_MT_MAIN_HPP
