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
%#   File: lib-version-hxx.t
%#
%# Author: $author$
%#   Date: 2/5/2020
%########################################################################
%with(%
%include_path,%(%else-then(%include_path%,%(%filepath(%input%)%)%)%)%,%
%is_framework,%(%else-then(%is_framework%,%(%is_Framework%)%)%)%,%
%framework,%(%else-then(%if-no(%is_framework%,,%(%framework%)%)%,%(%if-no(%is_framework%,,%(Framework)%)%)%)%)%,%
%Framework,%(%else-then(%if-no(%is_framework%,,%(%Framework%)%)%,%(%framework%)%)%)%,%
%FRAMEWORK,%(%else-then(%FRAMEWORK%,%(%toupper(%Framework%)%)%)%)%,%
%framework,%(%else-then(%_framework%,%(%tolower(%Framework%)%)%)%)%,%
%is_version,%(%else-then(%is_version%,%(%is_Version%)%)%)%,%
%version,%(%else-then(%if-no(%is_version%,,%(%version%)%)%,%(%if-no(%is_version%,,%(version)%)%)%)%)%,%
%Version,%(%else-then(%if-no(%is_version%,,%(%Version%)%)%,%(%if-no(%is_version%,,%(%version%)%)%)%)%)%,%
%VERSION,%(%else-then(%VERSION%,%(%toupper(%Version%)%)%)%)%,%
%version,%(%else-then(%_version%,%(%tolower(%Version%)%)%)%)%,%
%is_string,%(%else-then(%is_string%,%(%is_String%)%)%)%,%
%string,%(%else-then(%if-no(%is_string%,,%(%string%)%)%,%(%if-no(%is_string%,,%(char_string)%)%)%)%)%,%
%String,%(%else-then(%if-no(%is_string%,,%(%String%)%)%,%(%if-no(%is_string%,,%(%string%)%)%)%)%)%,%
%STRING,%(%else-then(%STRING%,%(%toupper(%String%)%)%)%)%,%
%string,%(%else-then(%_string%,%(%tolower(%String%)%)%)%)%,%
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
///   File: %Version%.hpp
///
/// Author: $author$
///   Date: %date()%
///////////////////////////////////////////////////////////////////////
#ifndef _XOS_LIB_VERSION_HPP
#define _XOS_LIB_VERSION_HPP

#include "xos/base/string.hpp"

namespace xos {
namespace lib {

///  Class: %Version%t
template 
<class TChar = char, 
 class TString = %String%t<TChar>,
 class TImplements = implement>
class _EXPORT_CLASS versiont: virtual public TImplements {
public:
    typedef TImplements implements;
    typedef %Version%t derives;

    typedef TString string_t;
    
    
    /// to_string
    virtual string_t to_string() const {
        const char_t *chars = 0;
        string_t to(this->name());
        to.append(this->name_separator());
        to.append_unsigned(this->major());
        to.append(this->major_separator());
        to.append_unsigned(this->minor());
        to.append(this->minor_separator());
        to.append_unsigned(this->revision());
        if ((chars = build()) && (chars[0])) {
           to.append(this->revision_separator());
           to.append(chars);
        }
        return to;
    }

    /// name / ...separator
    virtual const char_t* name() const {
        return "version";
    }
    virtual const char_t* name_separator() const {
        return "-";
    }
    virtual const char_t* major_separator() const {
        return ".";
    }
    virtual const char_t* minor_separator() const {
        return ".";
    }
    virtual const char_t* revision_separator() const {
        return "-";
    }

    /// major / minor / revision / build
    virtual unsigned major() const {
        return 0;
    }
    virtual unsigned minor() const {
        return 0;
    }
    virtual unsigned revision() const {
        return 0;
    }
    virtual const char_t* build() const {
        return 0;
    }
}; /// class %Version%t
typedef %Version%t<> %Version%;

} /// namespace lib
} /// namespace xos

#endif /// _XOS_LIB_VERSION_HPP
)%)%