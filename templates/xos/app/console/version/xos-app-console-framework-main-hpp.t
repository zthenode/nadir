%########################################################################
%# Copyright (c) 1988-2020 $organization$
%#
%# This software is provided by the author and contributors ``as is'' 
%# and any express or implied warranties, including, but not limited to, 
%# the implied warranties of merchantability and fitness for a particular 
%# purpose are disclaimed. In no event shall the author or contributors 
%# be liable for any direct, indirect, incidental, special, exemplary, 
%# or consequential damages (including, but not limited to, procurement 
%# of substitute goods or services; loss of use, data, or profits; or 
%# business interruption) however caused and on any theory of liability, 
%# whether in contract, strict liability, or tort (including negligence 
%# or otherwise) arising in any way out of the use of this software, 
%# even if advised of the possibility of such damage.
%#
%#   File: xos-app-console-framework-main-hpp.t
%#
%# Author: $author$
%#   Date: 5/18/2020
%########################################################################
%with(%
%is_framework,%(%else-then(%is_framework%,%(%is_Framework%)%)%)%,%
%framework,%(%else-then(%if-no(%is_framework%,,%(%framework%)%)%,%(%if-no(%is_framework%,,%(Framework)%)%)%)%)%,%
%Framework,%(%else-then(%if-no(%is_framework%,,%(%Framework%)%)%,%(%if-no(%is_framework%,,%(%framework%)%)%)%)%)%,%
%FRAMEWORK,%(%else-then(%FRAMEWORK%,%(%toupper(%Framework%)%)%)%)%,%
%framework,%(%else-then(%_framework%,%(%tolower(%Framework%)%)%)%)%,%
%is_which,%(%else-then(%is_which%,%(%is_Which%)%)%)%,%
%which,%(%else-then(%if-no(%is_which%,,%(%which%)%)%,%(%if-no(%is_which%,,%(default)%)%)%)%)%,%
%Which,%(%else-then(%if-no(%is_which%,,%(%Which%)%)%,%(%if-no(%is_which%,,%(%which%)%)%)%)%)%,%
%WHICH,%(%else-then(%WHICH%,%(%toupper(%Which%)%)%)%)%,%
%which,%(%else-then(%_which%,%(%tolower(%Which%)%)%)%)%,%
%is_run,%(%else-then(%is_run%,%(%is_Run%)%)%)%,%
%run,%(%else-then(%if-no(%is_run%,,%(%run%)%)%,%(%if-no(%is_run%,,%(run)%)%)%)%)%,%
%Run,%(%else-then(%if-no(%is_run%,,%(%Run%)%)%,%(%if-no(%is_run%,,%(%run%)%)%)%)%)%,%
%RUN,%(%else-then(%RUN%,%(%toupper(%Run%)%)%)%)%,%
%run,%(%else-then(%_run%,%(%tolower(%Run%)%)%)%)%,%
%is_which_run,%(%else-then(%is_which_run%,%(%is_Which_run%)%)%)%,%
%which_run,%(%else-then(%if-no(%is_which_run%,,%(%which_run%)%)%,%(%if-no(%is_which_run%,,%(%then-if(%Which%_)%%Run%)%)%)%)%)%,%
%Which_run,%(%else-then(%if-no(%is_which_run%,,%(%Which_run%)%)%,%(%if-no(%is_which_run%,,%(%which_run%)%)%)%)%)%,%
%WHICH_RUN,%(%else-then(%WHICH_RUN%,%(%toupper(%Which_run%)%)%)%)%,%
%which_run,%(%else-then(%_which_run%,%(%tolower(%Which_run%)%)%)%)%,%
%%(///////////////////////////////////////////////////////////////////////
/// Copyright (c) 1988-%year()% $organization$
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
///   Date: %date()%
///////////////////////////////////////////////////////////////////////
#ifndef XOS_APP_CONSOLE_%FRAMEWORK%_MAIN_HPP
#define XOS_APP_CONSOLE_%FRAMEWORK%_MAIN_HPP

#include "xos/app/console/%framework%/main_opt.hpp"

namespace xos {
namespace app {
namespace console {
namespace %framework% {

/// class maint
template <class TExtends = main_opt, class TImplements = typename TExtends::implements>
class exported maint: virtual public TImplements, public TExtends {
public:
    typedef TImplements implements;
    typedef TExtends extends;
    typedef maint derives;

    typedef typename extends::char_t char_t;
    typedef typename extends::end_char_t end_char_t;
    enum { end_char = extends::end_char };
    typedef typename extends::string_t string_t;
    typedef typename extends::reader_t reader_t;
    typedef typename extends::writer_t writer_t;
    typedef typename extends::file_t file_t;

    /// constructor / destructor
    maint(): %Which_run%_(0) {
    }
    virtual ~maint() {
    }
private:
    maint(const maint& copy) {
        throw xos::exception(exception_unexpected);
    }

protected:
    /// ...run
    int (derives::*%Which_run%_)(int argc, char_t** argv, char_t** env);
    virtual int default_run(int argc, char_t** argv, char_t** env) {
        int err = 0;
        if ((%Which_run%_)) {
            err = (this->*%Which_run%_)(argc, argv, env);
        } else {
            if (!(err = this->all_version_run(argc, argv, env))) {
                err = this->all_usage(argc, argv, env);
            }
        }
        return err;
    }

protected:
}; /// class maint
typedef maint<> main;

} /// namespace %framework%
} /// namespace console
} /// namespace app
} /// namespace xos

#endif /// ndef XOS_APP_CONSOLE_%FRAMEWORK%_MAIN_HPP 
)%)%