/* StorageService is designed to store chunks of binary data
 */

namespace csharp StorageService

exception StorageException {
    1: string Reason;
}

service StorageService {
    string Store(1: binary data)
        throws (1: StorageException ouch);

    binary Receive(1: string key)
        throws (1: StorageException ouch);
}
