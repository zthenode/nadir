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
%#   File: xos-lib-framework-version-cpp.t
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
%is_version,%(%else-then(%is_version%,%(%is_Version%)%)%)%,%
%version,%(%else-then(%if-no(%is_version%,,%(%version%)%)%,%(%if-no(%is_version%,,%(version)%)%)%)%)%,%
%Version,%(%else-then(%if-no(%is_version%,,%(%Version%)%)%,%(%if-no(%is_version%,,%(%version%)%)%)%)%)%,%
%VERSION,%(%else-then(%VERSION%,%(%toupper(%Version%)%)%)%)%,%
%version,%(%else-then(%_version%,%(%tolower(%Version%)%)%)%)%,%
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
///   File: %Version%.cpp
///
/// Author: $author$
///   Date: %date()%
///////////////////////////////////////////////////////////////////////
#include "xos/lib/%framework%/%Version%.hpp"

#if !defined(XOS_LIB_%FRAMEWORK%_VERSION_NAME)
#define XOS_LIB_%FRAMEWORK%_VERSION_NAME   "lib%framework%"
#endif /// !defined(XOS_LIB_%FRAMEWORK%_VERSION_NAME)

#if !defined(XOS_LIB_%FRAMEWORK%_VERSION_MAJOR)
#define XOS_LIB_%FRAMEWORK%_VERSION_MAJOR   0
#endif /// !defined(XOS_LIB_%FRAMEWORK%_VERSION_MAJOR)

#if !defined(XOS_LIB_%FRAMEWORK%_VERSION_MINOR)
#define XOS_LIB_%FRAMEWORK%_VERSION_MINOR   0
#endif /// !defined(XOS_LIB_%FRAMEWORK%_VERSION_MINOR)

#if !defined(XOS_LIB_%FRAMEWORK%_VERSION_RELEASE)
#define XOS_LIB_%FRAMEWORK%_VERSION_RELEASE 0
#endif /// !defined(XOS_LIB_%FRAMEWORK%_VERSION_RELEASE)

#if !defined(XOS_LIB_%FRAMEWORK%_VERSION_BUILD)
#define XOS_LIB_%FRAMEWORK%_VERSION_BUILD   %date()%
#endif /// !defined(XOS_LIB_%FRAMEWORK%_VERSION_BUILD)

#if !defined(XOS_LIB_%FRAMEWORK%_VERSION_BUILD_CHARS)
#define XOS_LIB_%FRAMEWORK%_VERSION_BUILD_CHARS   XOS_2CHARS(XOS_LIB_%FRAMEWORK%_VERSION_BUILD)
#endif /// !defined(XOS_LIB_%FRAMEWORK%_VERSION_BUILD_CHARS)

namespace xos {
namespace lib {
namespace %framework% {

namespace which {
/// class %Version%t
template <class TExtends = lib::extended::%Version%, class TImplements = typename TExtends::implements>
class exported %Version%t: virtual public TImplements, public TExtends {
public:
    typedef TImplements implements;
    typedef TExtends extends;
    typedef %Version%t derives;

    /// constructor / destructor
    %Version%t(const %Version%t& copy): extends(copy) {
    }
    %Version%t(): extends
    (XOS_LIB_%FRAMEWORK%_VERSION_NAME, 
     XOS_LIB_%FRAMEWORK%_VERSION_MAJOR, XOS_LIB_%FRAMEWORK%_VERSION_MINOR, 
     XOS_LIB_%FRAMEWORK%_VERSION_RELEASE, XOS_LIB_%FRAMEWORK%_VERSION_BUILD_CHARS) {
    }
    virtual ~%Version%t() {
    }
}; /// class %Version%t
typedef %Version%t<> %Version%;
} /// namespace which

/// class %Version%
const lib::%Version%& %Version%::which() {
    static const %framework%::which::%Version% %Version%;
    return %Version%;
}

} /// namespace %framework%
} /// namespace lib
} /// namespace xos
)%)%