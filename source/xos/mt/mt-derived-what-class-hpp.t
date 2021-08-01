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
%#   File: mt-os-what-class-hpp.t
%#
%# Author: $author$
%#   Date: 1/28/2020
%########################################################################
%with(%
%is_platform,%(%else-then(%is_platform%,%(%is_Platform%)%)%)%,%
%platform,%(%else-then(%if-no(%is_platform%,,%(%platform%)%)%,%(%if-no(%is_platform%,,%(platform)%)%)%)%)%,%
%Platform,%(%else-then(%if-no(%is_platform%,,%(%Platform%)%)%,%(%platform%)%)%)%,%
%PLATFORM,%(%else-then(%PLATFORM%,%(%toupper(%Platform%)%)%)%)%,%
%platform,%(%else-then(%_platform%,%(%tolower(%Platform%)%)%)%)%,%
%is_os,%(%else-then(%is_os%,%(%is_Os%)%)%)%,%
%os,%(%else-then(%if-no(%is_os%,,%(%os%)%)%,%(%if-no(%is_os%,,%(Os)%)%)%)%)%,%
%Os,%(%else-then(%if-no(%is_os%,,%(%Os%)%)%,%(%os%)%)%)%,%
%OS,%(%else-then(%OS%,%(%toupper(%Os%)%)%)%)%,%
%os,%(%else-then(%_os%,%(%tolower(%Os%)%)%)%)%,%
%is_what,%(%else-then(%is_what%,%(%is_What%)%)%)%,%
%what,%(%else-then(%if-no(%is_what%,,%(%what%)%)%,%(%if-no(%is_what%,,%(What)%)%)%)%)%,%
%What,%(%else-then(%if-no(%is_what%,,%(%What%)%)%,%(%what%)%)%)%,%
%WHAT,%(%else-then(%WHAT%,%(%toupper(%What%)%)%)%)%,%
%what,%(%else-then(%_what%,%(%tolower(%What%)%)%)%)%,%
%%(///////////////////////////////////////////////////////////////////////
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
///   File: %What%.hpp
///
/// Author: $author$
///   Date: %date()%
///////////////////////////////////////////////////////////////////////
#if !defined(XOS_MT_%OS%_%WHAT%_HPP) || defined(XOS_MT_OS_%OS%_%WHAT%_HPP)
#if !defined(XOS_MT_%OS%_%WHAT%_HPP) && !defined(XOS_MT_OS_%OS%_%WHAT%_HPP)
#define XOS_MT_%OS%_%WHAT%_HPP
#endif /// !defined(XOS_MT_%OS%_%WHAT%_HPP) && !defined(XOS_MT_OS_%OS%_%WHAT%_HPP)

#include "xos/mt/%What%.hpp"

#if defined(XOS_MT_OS_%OS%_%WHAT%_HPP)
#include "xos/platform/os/%Os%/%What%.h"
#else defined(XOS_MT_OS_%OS%_%WHAT%_HPP)
#if defined(WINDOWS)
#include "xos/platform/microsoft/windows/%Os%/%What%.h"
#else /// defined(WINDOWS)
#include <errno.h>
#endif /// defined(WINDOWS)
#endif /// defined(XOS_MT_OS_%OS%_%WHAT%_HPP)

namespace xos {
namespace mt {
#if defined(XOS_MT_OS_%OS%_%WHAT%_HPP)
namespace os {
#endif /// defined(XOS_MT_OS_%OS%_%WHAT%_HPP)
namespace %Os% {

typedef %Platform%_%What%_t %What%_t;
typedef %What%_t* %What%_attached_t;

/// class %What%t
template 
<class TExtends = mt::extended::%What%t<%What%_attached_t>, 
 class TImplements = typename TExtends::implements>
class exported %What%t: virtual public TImplements, public TExtends {
public:
    typedef TImplements implements;
    typedef TExtends extends;
    typedef %What%t derives;

    typedef typename extends::attached_t attached_t;
    typedef typename extends::unattached_t unattached_t;
    enum { unattached = extends::unattached };

    /// constructor / destructor
    %What%t(attached_t detached, bool is_created, bool is_logged): extends(detached, is_created, is_logged) {
    }
    %What%t(attached_t detached, bool is_created): extends(detached, is_created) {
    }
    %What%t(attached_t detached): extends(detached) {
    }
    %What%t(bool is_logged): extends(is_logged) {
        if (!(this->create())) {
            LOGGER_IS_LOGGED_ERROR("...failed on this->create() throw (create_exception(create_failed))...");
            throw (create_exception(create_failed));
        }
    }
    %What%t(const %What%t& copy): extends(copy) {
    }
    %What%t() {
        if (!(this->create())) {
            LOGGER_IS_LOGGED_ERROR("...failed on this->create() throw (create_exception(create_failed))...");
            throw (create_exception(create_failed));
        }
    }
    virtual ~%What%t() {
        if (!(this->destroyed())) {
            LOGGER_IS_LOGGED_ERROR("...failed on this->destroyed() throw (create_exception(destroy_failed))...");
            throw (create_exception(destroy_failed));
        }
    }

protected:
    %What%_t %What%_;
}; /// class %What%t
typedef %What%t<> %What%;

} /// namespace %Os%
#if defined(XOS_MT_OS_%OS%_%WHAT%_HPP)
} /// namespace os 
#endif /// defined(XOS_MT_OS_%OS%_%WHAT%_HPP)
} /// namespace mt
} /// namespace xos

#endif /// !defined(XOS_MT_%OS%_%WHAT%_HPP) || defined(XOS_MT_OS_%OS%_%WHAT%_HPP)
)%)%