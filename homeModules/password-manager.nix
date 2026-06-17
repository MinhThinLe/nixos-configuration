{ ... }:
{
    programs.keepassxc = {
        enable = true;
        settings = {
            General.ConfigVersion = 2;

            Browser = {
                Enabled = true;
                CustomProxyLocation = "";
            };

            FdoSecrets.Enabled = true;

            GUI.TrayIconAppearance = "monochrome-light";

            KeeShare = {
                Active = "\"<?xml version=\"1.0\"?><KeeShare><Active/></KeeShare>\\n\"";
                Own = "\"<?xml version=\"1.0\"?><KeeShare><PrivateKey>MIIEvAIBADANBgkqhkiG9w0BAQEFAASCBKYwggSiAgEAAoIBAQDH9WTPIgmb9VdOZRrhMeye2zdx4J4Q4jjfzrH16cgrUwHj/bdcpkXvOL/cyG80IcEvSkqGSNS4PGscyUDEYyw8UwPEpW5iGN1Lal9z4nsiHErF0vl2rKrZHdXYsZZcPrDDc9WqxPsT1xFWmNUJf5ToZz71BA0d2ZAP4fB31sD6/QxiFfStzuMmRngbB5r7jGxTMMA6kH6arWneb9aCwBzSwEg7eGLxxl7awuvvnfKijBqQF1DpruMPTEWfAnKYmYvV4fEXluu7b+ZVTgAn2Fbyz88crRLivMNBg/h11Vh6Q8SEAXBv7wrdnBLj5W65JtjjXtT5PZD3FzURfGlrZ27lAgMBAAECggEAEeb3ARJ3kMZ87BBiQTIykKBozOHC1Rkj5WnAhhdJrBNQ8oQXJAzg6wOGLfKl/iFdhendVTt1DA+guWGNUmfcoIQALN1wzgiS23spE5t90bZ9vUtfuU/JNgoVSMLRhu237q/Su+jJ3+Nb8ohZXnHVN59yxAX6VKdTXhCo8lnASlgv+eUCl3lJLf2esnc5f/jb5fhRnCvhASR34OMqidPLQsmTCKDCoIMuM1O5VIQs+Z0Rih1kLZocDLaSIymegPmOQPXJYZ1XLyn7mBrLfbqfvnX7kpw7Gy3M5Jii+xhrxQGb4RG4lJaP5KbCDKs/Z5O76kM1MAaeaL/7fMVAFTqfmwKBgQDcGWVQNKOVc8iFCHfZizcULGxRp3O9qJdcwY1PGRzABVVXsNXp/cE3gl4rBGZi/qmRpdd33ynsDrJ8ZWTFmTlb2JfU3B+1GrWZoaCj6YZjIcRFYkUpWrYSAfEAAAzM6yzNdiDjPfyupEBCfR9GeLl9xetpxwuZiJUvZ1nRfVZvgwKBgQDokv4m7Z+X0BT9K02itu7icdhpOvrYavFhEEYYos0MGti+I86uNredFLn6b0kJDOEF3SQ9LDB36lgV5RfVPgarkjgkPiOmCYq7QcN/msoLrbdwe+oNM/Rzqzrxfa9KB5RoIsWJtohW+qfPHhhU2W6fHODYafwboO1it3nASeuzdwKBgH4jU8vWjxWcyINtafpT7ZnzJ5TYSd2c3Do9drWpJ6/onpNl9gJm+i/M2BkBKYh8eEPPbp/1VnpBpgritREFkjjP9Zv5F3bcOs00MvMdZ3YyqOA2xHpB0Wyajjq4zJ03/nI1y/1PzhtsaKNyP9VMZMnu/s6dU0mHXDBRo8kKctnvAoGAY2AjrriMH88umLq/Eo695g4lHVmxQ3X2q7XLbc1qdgimoiAkuPXyYPExQlv4xiA1qk7CpEzUbPi6KKjaFSjKqtbwnDPdAZ5EJB1GjqiyOmlA35Ri/r87bY01w2gj1SsF87Uf2OcgvKGfwHUoimDZzq0FOhOXQKrzo+Gn6UzspKMCgYBBFhiEbU+gGnORqhTq//nR0rOIgZOe5zkQydkKwoMLNuUF0A+PFfDHIR0xYNJbTUfFGf80kHgf6+p/7bggliinKjcsDy7/s20OJlI2rRz/+tDNSIjK0QCgL2sz+pZBLUA6nI8usAY1EQ7tPT7N+JAcXxjk+eHkUmWFxmxrxAh/8A==</PrivateKey><PublicKey><Signer>t0ast</Signer><Key>MIIEvAIBADANBgkqhkiG9w0BAQEFAASCBKYwggSiAgEAAoIBAQDH9WTPIgmb9VdOZRrhMeye2zdx4J4Q4jjfzrH16cgrUwHj/bdcpkXvOL/cyG80IcEvSkqGSNS4PGscyUDEYyw8UwPEpW5iGN1Lal9z4nsiHErF0vl2rKrZHdXYsZZcPrDDc9WqxPsT1xFWmNUJf5ToZz71BA0d2ZAP4fB31sD6/QxiFfStzuMmRngbB5r7jGxTMMA6kH6arWneb9aCwBzSwEg7eGLxxl7awuvvnfKijBqQF1DpruMPTEWfAnKYmYvV4fEXluu7b+ZVTgAn2Fbyz88crRLivMNBg/h11Vh6Q8SEAXBv7wrdnBLj5W65JtjjXtT5PZD3FzURfGlrZ27lAgMBAAECggEAEeb3ARJ3kMZ87BBiQTIykKBozOHC1Rkj5WnAhhdJrBNQ8oQXJAzg6wOGLfKl/iFdhendVTt1DA+guWGNUmfcoIQALN1wzgiS23spE5t90bZ9vUtfuU/JNgoVSMLRhu237q/Su+jJ3+Nb8ohZXnHVN59yxAX6VKdTXhCo8lnASlgv+eUCl3lJLf2esnc5f/jb5fhRnCvhASR34OMqidPLQsmTCKDCoIMuM1O5VIQs+Z0Rih1kLZocDLaSIymegPmOQPXJYZ1XLyn7mBrLfbqfvnX7kpw7Gy3M5Jii+xhrxQGb4RG4lJaP5KbCDKs/Z5O76kM1MAaeaL/7fMVAFTqfmwKBgQDcGWVQNKOVc8iFCHfZizcULGxRp3O9qJdcwY1PGRzABVVXsNXp/cE3gl4rBGZi/qmRpdd33ynsDrJ8ZWTFmTlb2JfU3B+1GrWZoaCj6YZjIcRFYkUpWrYSAfEAAAzM6yzNdiDjPfyupEBCfR9GeLl9xetpxwuZiJUvZ1nRfVZvgwKBgQDokv4m7Z+X0BT9K02itu7icdhpOvrYavFhEEYYos0MGti+I86uNredFLn6b0kJDOEF3SQ9LDB36lgV5RfVPgarkjgkPiOmCYq7QcN/msoLrbdwe+oNM/Rzqzrxfa9KB5RoIsWJtohW+qfPHhhU2W6fHODYafwboO1it3nASeuzdwKBgH4jU8vWjxWcyINtafpT7ZnzJ5TYSd2c3Do9drWpJ6/onpNl9gJm+i/M2BkBKYh8eEPPbp/1VnpBpgritREFkjjP9Zv5F3bcOs00MvMdZ3YyqOA2xHpB0Wyajjq4zJ03/nI1y/1PzhtsaKNyP9VMZMnu/s6dU0mHXDBRo8kKctnvAoGAY2AjrriMH88umLq/Eo695g4lHVmxQ3X2q7XLbc1qdgimoiAkuPXyYPExQlv4xiA1qk7CpEzUbPi6KKjaFSjKqtbwnDPdAZ5EJB1GjqiyOmlA35Ri/r87bY01w2gj1SsF87Uf2OcgvKGfwHUoimDZzq0FOhOXQKrzo+Gn6UzspKMCgYBBFhiEbU+gGnORqhTq//nR0rOIgZOe5zkQydkKwoMLNuUF0A+PFfDHIR0xYNJbTUfFGf80kHgf6+p/7bggliinKjcsDy7/s20OJlI2rRz/+tDNSIjK0QCgL2sz+pZBLUA6nI8usAY1EQ7tPT7N+JAcXxjk+eHkUmWFxmxrxAh/8A==</Key></PublicKey></KeeShare>\\n\"";
                QuietSuccess = true;
            };

            PasswordGenerator = {
                AdditionalChars = "";
                ExcludedChars = "";
            };
        };
    };

    xdg.autostart.enable = true;
}
