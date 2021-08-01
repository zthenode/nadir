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
///   File: main_opt.hpp
///
/// Author: $author$
///   Date: 12/26/2019
///////////////////////////////////////////////////////////////////////
#ifndef XOS_APP_CONSOLE_MT_MAIN_OPT_HPP
#define XOS_APP_CONSOLE_MT_MAIN_OPT_HPP

#include "xos/app/console/os/main.hpp"

#define XOS_APP_CONSOLE_MT_MAIN_THREADS_OPT "threads"
#define XOS_APP_CONSOLE_MT_MAIN_THREADS_OPTARG_REQUIRED MAIN_OPT_ARGUMENT_REQUIRED
#define XOS_APP_CONSOLE_MT_MAIN_THREADS_OPTARG_RESULT 0
#define XOS_APP_CONSOLE_MT_MAIN_THREADS_OPTARG "number"
#define XOS_APP_CONSOLE_MT_MAIN_THREADS_OPTUSE "Number of Threads"
#define XOS_APP_CONSOLE_MT_MAIN_THREADS_OPTVAL_S "r:"
#define XOS_APP_CONSOLE_MT_MAIN_THREADS_OPTVAL_C 'r'
#define XOS_APP_CONSOLE_MT_MAIN_THREADS_OPTION \
   {XOS_APP_CONSOLE_MT_MAIN_THREADS_OPT, \
    XOS_APP_CONSOLE_MT_MAIN_THREADS_OPTARG_REQUIRED, \
    XOS_APP_CONSOLE_MT_MAIN_THREADS_OPTARG_RESULT, \
    XOS_APP_CONSOLE_MT_MAIN_THREADS_OPTVAL_C}, \

#define XOS_APP_CONSOLE_MT_MAIN_SLEEP_OPT "sleep"
#define XOS_APP_CONSOLE_MT_MAIN_SLEEP_OPTARG_REQUIRED MAIN_OPT_ARGUMENT_REQUIRED
#define XOS_APP_CONSOLE_MT_MAIN_SLEEP_OPTARG_RESULT 0
#define XOS_APP_CONSOLE_MT_MAIN_SLEEP_OPTARG "milliseconds"
#define XOS_APP_CONSOLE_MT_MAIN_SLEEP_OPTUSE "Sleep Timeout"
#define XOS_APP_CONSOLE_MT_MAIN_SLEEP_OPTVAL_S "s:"
#define XOS_APP_CONSOLE_MT_MAIN_SLEEP_OPTVAL_C 's'
#define XOS_APP_CONSOLE_MT_MAIN_SLEEP_OPTION \
   {XOS_APP_CONSOLE_MT_MAIN_SLEEP_OPT, \
    XOS_APP_CONSOLE_MT_MAIN_SLEEP_OPTARG_REQUIRED, \
    XOS_APP_CONSOLE_MT_MAIN_SLEEP_OPTARG_RESULT, \
    XOS_APP_CONSOLE_MT_MAIN_SLEEP_OPTVAL_C}, \

#define XOS_APP_CONSOLE_MT_MAIN_TIMEOUT_OPT "timeout"
#define XOS_APP_CONSOLE_MT_MAIN_TIMEOUT_OPTARG_REQUIRED MAIN_OPT_ARGUMENT_REQUIRED
#define XOS_APP_CONSOLE_MT_MAIN_TIMEOUT_OPTARG_RESULT 0
#define XOS_APP_CONSOLE_MT_MAIN_TIMEOUT_OPTARG "milliseconds"
#define XOS_APP_CONSOLE_MT_MAIN_TIMEOUT_OPTUSE "Wait Timeout"
#define XOS_APP_CONSOLE_MT_MAIN_TIMEOUT_OPTVAL_S "t:"
#define XOS_APP_CONSOLE_MT_MAIN_TIMEOUT_OPTVAL_C 't'
#define XOS_APP_CONSOLE_MT_MAIN_TIMEOUT_OPTION \
   {XOS_APP_CONSOLE_MT_MAIN_TIMEOUT_OPT, \
    XOS_APP_CONSOLE_MT_MAIN_TIMEOUT_OPTARG_REQUIRED, \
    XOS_APP_CONSOLE_MT_MAIN_TIMEOUT_OPTARG_RESULT, \
    XOS_APP_CONSOLE_MT_MAIN_TIMEOUT_OPTVAL_C}, \

#define XOS_APP_CONSOLE_MT_MAIN_OPTIONS_CHARS_ONLY \
   XOS_APP_CONSOLE_MT_MAIN_THREADS_OPTVAL_S \
   XOS_APP_CONSOLE_MT_MAIN_SLEEP_OPTVAL_S \
   XOS_APP_CONSOLE_MT_MAIN_TIMEOUT_OPTVAL_S

#define XOS_APP_CONSOLE_MT_MAIN_OPTIONS_OPTIONS_ONLY \
   XOS_APP_CONSOLE_MT_MAIN_THREADS_OPTION \
   XOS_APP_CONSOLE_MT_MAIN_SLEEP_OPTION \
   XOS_APP_CONSOLE_MT_MAIN_TIMEOUT_OPTION

#define XOS_APP_CONSOLE_MT_MAIN_OPTIONS_CHARS \
   XOS_APP_CONSOLE_MT_MAIN_OPTIONS_CHARS_ONLY \
   XOS_APP_CONSOLE_OS_MAIN_OPTIONS_CHARS

#define XOS_APP_CONSOLE_MT_MAIN_OPTIONS_OPTIONS \
   XOS_APP_CONSOLE_MT_MAIN_OPTIONS_OPTIONS_ONLY \
   XOS_APP_CONSOLE_OS_MAIN_OPTIONS_OPTIONS

#define XOS_APP_CONSOLE_MT_OS_MAIN_OPTIONS_CHARS \
   XOS_APP_CONSOLE_MT_MAIN_OPTIONS_CHARS_ONLY \
   XOS_CONSOLE_MAIN_OPTIONS_CHARS

#define XOS_APP_CONSOLE_MT_OS_MAIN_OPTIONS_OPTIONS \
   XOS_APP_CONSOLE_MT_MAIN_OPTIONS_OPTIONS_ONLY \
   XOS_CONSOLE_MAIN_OPTIONS_OPTIONS

#define XOS_APP_CONSOLE_MT_MAIN_ARGS 0
#define XOS_APP_CONSOLE_MT_MAIN_ARGV

namespace xos {
namespace app {
namespace console {
namespace mt {

/// class main_optt
template <class TExtends = os::main, class TImplements = typename TExtends::implements>
class exported main_optt: virtual public TImplements, public TExtends {
public:
    typedef TImplements implements;
    typedef TExtends extends;
    typedef main_optt derives;

    typedef typename extends::string_t string_t;
    typedef typename extends::char_t char_t;
    typedef typename extends::end_char_t end_char_t;
    enum { end_char = extends::end_char };

    /// constructor / destructor
    main_optt() {
    }
    virtual ~main_optt() {
    }
private:
    main_optt(const main_optt& copy) {
    }

protected:
    /// ...option...
    virtual int on_threads_option
    (int optval, const char_t* optarg,
     const char_t* optname, int optind,
     int argc, char_t**argv, char_t**env) {
        int err = 0;
        if ((optarg) && (optarg[0])) {
        }
        return err;
    }
    virtual int on_sleep_option
    (int optval, const char_t* optarg,
     const char_t* optname, int optind,
     int argc, char_t**argv, char_t**env) {
        int err = 0;
        if ((optarg) && (optarg[0])) {
        }
        return err;
    }
    virtual int on_timeout_option
    (int optval, const char_t* optarg,
     const char_t* optname, int optind,
     int argc, char_t**argv, char_t**env) {
        int err = 0;
        if ((optarg) && (optarg[0])) {
        }
        return err;
    }
    virtual int on_option
    (int optval, const char_t* optarg,
     const char_t* optname, int optind,
     int argc, char_t**argv, char_t**env) {
        int err = 0;
        switch(optval) {
        case XOS_APP_CONSOLE_MT_MAIN_THREADS_OPTVAL_C:
            err = on_sleep_option
            (optval, optarg, optname, optind, argc, argv, env);
            break;
        case XOS_APP_CONSOLE_MT_MAIN_SLEEP_OPTVAL_C:
            err = on_sleep_option
            (optval, optarg, optname, optind, argc, argv, env);
            break;
        case XOS_APP_CONSOLE_MT_MAIN_TIMEOUT_OPTVAL_C:
            err = on_timeout_option
            (optval, optarg, optname, optind, argc, argv, env);
            break;
        default:
            err = extends::on_option
            (optval, optarg, optname, optind, argc, argv, env);
        }
        return err;
    }
    virtual const char_t* option_usage
    (const char_t*& optarg, const struct option* longopt) {
        const char_t* chars = "";
        switch(longopt->val) {
        case XOS_APP_CONSOLE_MT_MAIN_THREADS_OPTVAL_C:
            optarg = XOS_APP_CONSOLE_MT_MAIN_THREADS_OPTARG;
            chars = XOS_APP_CONSOLE_MT_MAIN_THREADS_OPTUSE;
            break;
        case XOS_APP_CONSOLE_MT_MAIN_SLEEP_OPTVAL_C:
            optarg = XOS_APP_CONSOLE_MT_MAIN_SLEEP_OPTARG;
            chars = XOS_APP_CONSOLE_MT_MAIN_SLEEP_OPTUSE;
            break;
        case XOS_APP_CONSOLE_MT_MAIN_TIMEOUT_OPTVAL_C:
            optarg = XOS_APP_CONSOLE_MT_MAIN_TIMEOUT_OPTARG;
            chars = XOS_APP_CONSOLE_MT_MAIN_TIMEOUT_OPTUSE;
            break;
        default:
            chars = extends::option_usage(optarg, longopt);
        }
        return chars;
    }
    virtual const char_t* options(const struct option*& longopts) {
        int err = 0;
        static const char_t* chars = XOS_APP_CONSOLE_MT_MAIN_OPTIONS_CHARS;
        static struct option optstruct[]= {
            XOS_APP_CONSOLE_MT_MAIN_OPTIONS_OPTIONS
            {0, 0, 0, 0}};
        longopts = optstruct;
        return chars;
    }

    /// ...argument...
    virtual const char_t* arguments(const char_t**& argv) {
        static const char_t* _args = XOS_APP_CONSOLE_MT_MAIN_ARGS;
        static const char_t* _argv[] = {
            XOS_APP_CONSOLE_MT_MAIN_ARGV
            0};
        argv = _argv;
        return _args;
    }
}; /// class main_optt
typedef main_optt<> main_opt;

namespace os {
/// class main_optt
template 
<class TExtends = mt::main_optt<xos::console::getopt::main>, 
 class TImplements = typename TExtends::implements>
class exported main_optt: virtual public TImplements, public TExtends {
public:
    typedef TImplements implements;
    typedef TExtends extends;
    typedef main_optt derives;

    typedef typename extends::string_t string_t;
    typedef typename extends::char_t char_t;
    typedef typename extends::end_char_t end_char_t;
    enum { end_char = extends::end_char };

    /// constructor / destructor
    main_optt() {
    }
    virtual ~main_optt() {
    }
private:
    main_optt(const main_optt& copy) {
    }

protected:
    /// options
    virtual const char_t* options(const struct option*& longopts) {
        int err = 0;
        static const char_t* chars = XOS_APP_CONSOLE_MT_OS_MAIN_OPTIONS_CHARS;
        static struct option optstruct[]= {
            XOS_APP_CONSOLE_MT_OS_MAIN_OPTIONS_OPTIONS
            {0, 0, 0, 0}};
        longopts = optstruct;
        return chars;
    }
}; /// class main_optt
typedef main_optt<> main_opt;
} /// namespace os

} /// namespace mt
} /// namespace console
} /// namespace app
} /// namespace xos

#endif /// ndef XOS_APP_CONSOLE_MT_MAIN_OPT_HPP
