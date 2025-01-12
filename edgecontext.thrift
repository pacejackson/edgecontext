namespace py reddit_edgecontext.thrift
namespace go reddit.edgecontext
namespace java com.reddit.edgecontext

/**A raw authentication token as returned by the authentication service.

*/
typedef string AuthenticationToken

/** IETF language tag representing the preferred locale for
the client, used for providing localized content. Consists of
an ISO 639-1 primary language subtag and an optional
ISO 3166-1 alpha-2 region subtag separated by an underscore.
e.g. en, en_US

*/
typedef string LocaleCode

/** A two-character ISO 3166-1 country code representing the current
geographic location of the client.

*/
typedef string CountryCode

/** The components of the Reddit LoID cookie that we want to propagate between
services.

This model is a component of the "Edge-Request" header.  You should not need to
interact with this model directly, but rather through the EdgeRequestContext
interface provided by baseplate.

*/
struct Loid {
    /** The ID of the LoID cookie.

    */
    1: string id;
    /** The time when the LoID cookie was created in epoch milliseconds.

    */
    2: i64 created_ms;
}

/** The components of the Reddit Session tracker cookie that we want to
propagate between services.

This model is a component of the "Edge-Request" header.  You should not need to
interact with this model directly, but rather through the EdgeRequestContext
interface provided by baseplate.

*/
struct Session {
    /** The ID of the Session tracker cookie.

    */
    1: string id;
}

/** The components of the device making a request to our services that we want to
propogate between services.

This model is a component of the "Edge-Request" header.  You should not need to
interact with this model directly, but rather through the EdgeRequestContext
interface provided by baseplate.

*/
struct Device {
    /** The ID of the device.

    */
    1: string id;
}

/** Metadata about the origin service for a request.

The "origin" service is the service responsible for handling the request from
the client.

This model is a component of the "Edge-Request" header.  You should not need to
interact with this model directly, but rather through the EdgeRequestContext
interface provided by baseplate.
*/
struct OriginService {
    /** The name of the origin service.

    */
    1: string name
}

/** Geolocation data from a request to our services that we want to
propagate between services.

This model is a component of the "Edge-Request" header.  You should not need to
interact with this model directly, but rather through the EdgeRequestContext
interface provided by baseplate.

*/
struct Geolocation {
    /** The country code of the requesting client based on geographic location.
    */
    1: CountryCode country_code
}

/** Unique identifier of this Edge Request

This model is a component of the "Edge-Request" header.  You should not need to
interact with this model directly, but rather through the EdgeRequestContext
interface provided by baseplate.

*/
struct RequestId {
    /** The id of this Edge Request, in the most human-readable format.
    */
    1: string readable_id
}

/** Locale data from a request to our services that we want to
propagate between services.

This model is a component of the "Edge-Request" header.  You should not need to
interact with this model directly, but rather through the EdgeRequestContext
interface provided by baseplate.

*/
struct Locale {
    /** IETF language code representing the client locale preferences.
    Can be either {lang} or {lang}_{region} format. e.g. en, en_US
    */
    1: LocaleCode locale_code
}

/** Container model for the Edge-Request context header.

Baseplate will automatically parse this from the "Edge-Request" header and
provides an interface that wraps this Thrift model.  You should not need to
interact with this model directly, but rather through the EdgeRequestContext
interface provided by baseplate.

*/
struct Request {
    1: Loid loid;
    2: Session session;
    3: AuthenticationToken authentication_token;
    4: Device device;
    5: OriginService origin_service;
    6: Geolocation geolocation;
    7: optional RequestId request_id;
    8: optional Locale locale;
}
