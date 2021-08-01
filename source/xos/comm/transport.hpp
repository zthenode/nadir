///////////////////////////////////////////////////////////////////////
/// Copyright (c) 1988-2021 $organization$
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
///   File: transport.hpp
///
/// Author: $author$
///   Date: 3/22/2021
///////////////////////////////////////////////////////////////////////
#ifndef XOS_COMM_TRANSPORT_HPP
#define XOS_COMM_TRANSPORT_HPP

#include "xos/base/logged.hpp"

namespace xos {
namespace comm {

/// class transportt
template <class TImplements = loggedt<> >
class exported transportt: virtual public TImplements {
public:
    typedef TImplements implements;
    typedef transportt derives; 
    
    /// constructors / destructor
    virtual ~transportt() {
    }
}; /// class transportt
typedef transportt<> transport;

namespace extended {
/// class transportt
template <class TExtends = extend, class TImplements = comm::transportt<> >
class exported transportt: virtual public TImplements, public TExtends {
public:
    typedef TImplements implements;
    typedef TExtends extends;
    typedef transportt derives; 
    
    /// constructors / destructor
    transportt(const transportt& copy): extends(copy) {
    }
    transportt() {
    }
    virtual ~transportt() {
    }
}; /// class transportt
typedef transportt<> transport;
} /// namespace extended

} /// namespace comm
} /// namespace xos

#endif /// XOS_COMM_TRANSPORT_HPP
